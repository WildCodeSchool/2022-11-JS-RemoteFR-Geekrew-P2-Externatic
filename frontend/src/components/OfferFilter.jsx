import React, { useState } from "react";

function OfferFilterForm() {
  const [isModalOpen, setIsModalOpen] = useState(false); // Définir l'état pour le popup

  const [formData, setFormData] = useState({
    salary: [],
    contract: [],
    technologies: [],
    sectors: [],
  });

  const handleChange = (e) => {
    e.preventDefault();
    const { name, value, checked, type } = e.target;
    const val = type === "checkbox" ? checked : value;
    setFormData({ ...formData, [name]: val });
  };

  const handlePopup = () => {
    setIsModalOpen(!isModalOpen);
  }; // Gérer l'état du popup

  return (
    <div>
      <button
        type="button"
        className="bg-blue-500 hover:bg-blue-700 text-black font-bold py-2 px-4 rounded"
        onClick={handlePopup}
      >
        Afficher les filtres
      </button>

      {/* Popup */}
      {isModalOpen ? (
        <div className="justify-center items-center flex overflow-x-hidden overflow-y-auto fixed inset-0 z-50 outline-none focus:outline-none">
          <div className="absolute top-0 right-0 w-auto my-6 mx-auto max-w-sm">
            <div className="border-0 rounded-lg shadow-lg relative flex flex-col w-full bg-white outline-none focus:outline-none">
              <div className="flex items-start justify-between p-5 border-b border-solid border-gray-300 rounded-t">
                <h3 className="text-2xl text-black font-semibold">Filtres</h3>
                <button
                  type="button"
                  className="p-1 ml-auto bg-transparent border-0 text-black opacity-5 float-right text-3xl leading-none font-semibold outline-none focus:outline-none"
                >
                  <span className="bg-transparent text-black opacity-5 h-6 w-6 text-2xl block outline-none focus:outline-none">
                    ×
                  </span>
                </button>
              </div>
              <div className="relative p-6 flex-auto">
                <h3 className="text-lg font-medium mb-2">Salaire</h3>
                <input
                  type="range"
                  id="salary"
                  name="salary"
                  min="25000"
                  max="80000"
                  value={formData.salary}
                  onChange={handleChange}
                  step="1000"
                  list="tickmarks"
                  className="block w-full bg-main p-1 rounded my-2 color-main"
                />
                <datalist id="tickmarks">
                  <option value="30000">30 000 €</option>
                  <option value="40000">40 000 €</option>
                  <option value="50000">50 000 €</option>
                  <option value="60000">60 000 €</option>
                  <option value="70000">70 000 €</option>
                  <option value="80000">80 000 €</option>
                </datalist>
                <span className="text-sm text-gray-700">
                  {formData.salary} €/an
                </span>
                <h3 className="text-lg font-medium mb-2">Contrat</h3>
                <div className="flex flex-col">
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="contract"
                      value="CDI"
                      checked={formData.contract.includes("CDI")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">CDI</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="contract"
                      value="Stage"
                      checked={formData.contract.includes("Stage")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Stage</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="contract"
                      value="CDD"
                      checked={formData.contract.includes("CDD")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">CDD</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="contract"
                      value="Alternance"
                      checked={formData.contract.includes("Alternance")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Alternance</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="contract"
                      value="Freelance"
                      checked={formData.contract.includes("Freelance")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Freelance</span>
                  </label>
                </div>
                <br />
                <h3 className="text-lg font-medium mb-2">Technologies</h3>
                <div className="flex flex-col">
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="technologies"
                      value="Javascript"
                      checked={formData.technologies.includes("Javascript")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Javascript</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="technologies"
                      value="Angular"
                      checked={formData.technologies.includes("Angular")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Angular</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="technologies"
                      value="ReactJS"
                      checked={formData.technologies.includes("ReactJS")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">ReactJS</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="technologies"
                      value="PHP"
                      checked={formData.technologies.includes("PHP")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">PHP</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="technologies"
                      value="Symphony"
                      checked={formData.technologies.includes("Symphony")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Symphony</span>
                  </label>
                </div>
                <br />
                <h3 className="text-lg font-medium mb-2">Secteurs</h3>
                <div className="flex flex-col">
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="sectors"
                      value="Aéronautique"
                      checked={formData.sectors.includes("Aéronautique")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Aéronautique</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="sectors"
                      value="Santé"
                      checked={formData.sectors.includes("Santé")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Santé</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="sectors"
                      value="Agroalimentaire"
                      checked={formData.sectors.includes("Agroalimentaire")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Agroalimentaire</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="sectors"
                      value="Informatique"
                      checked={formData.sectors.includes("Informatique")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Informatique</span>
                  </label>
                  <label className="inline-flex items-center mt-2">
                    <input
                      type="checkbox"
                      name="sectors"
                      value="Banque/Assurance"
                      checked={formData.sectors.includes("Banque/Assurance")}
                      onChange={handleChange}
                      className="form-checkbox h-5 w-5 text-blue-600"
                    />
                    <span className="ml-2 text-gray-700">Banque/Assurance</span>
                  </label>
                </div>
              </div>
              <div className="flex items-center justify-end p-6 border-t border-solid border-gray-300 rounded-b">
                <button
                  className="text-red-500 background-transparent font-bold uppercase px-6 py-2 text-sm outline-none focus:outline-none mr-1 mb-1"
                  type="button"
                  style={{ transition: "all .15s ease" }}
                  onClick={handlePopup}
                >
                  Annuler
                </button>
                <button
                  className="bg-green-500 text-black active:bg-green-600 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1"
                  type="button"
                  style={{ transition: "all .15s ease" }}
                  onClick={handlePopup}
                >
                  Filtrer
                </button>
              </div>
            </div>
          </div>
        </div>
      ) : null}
    </div>
  );
}
export default OfferFilterForm;
