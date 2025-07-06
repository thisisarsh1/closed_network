import '../models/NewsModel.dart';

List<UpdateModel> updates = [
  // ───────── 1st YEAR ─────────
  UpdateModel(
    title: "Orientation Timetable",
    description: "Full schedule for new students.",
    year: "1",
    votes: 42,
    isDownload: true,
    link: "https://www.emmanuel.edu/sites/default/files/2025-06/student-orientation-schedule-2025.pdf", // orientation schedule PDF :contentReference[oaicite:0]{index=0}
  ),
  UpdateModel(
    title: "Maths Lecture Notice",
    description: "Tomorrow’s lecture moved to Room 201.",
    year: "1",
    votes: 14,
    isDownload: false,
    link: null,
  ),
  UpdateModel(
    title: "C Programming Notes",
    description: "Unit‑wise PDF notes.",
    year: "1",
    votes: 55,
    isDownload: true,
    link: "https://ocw.mit.edu/courses/6-087-practical-programming-in-c-january-iap-2010/b7f13dd2771c6e8557e0877457d07543_MIT6_087IAP10_lec01.pdf", // MIT OCW C notes :contentReference[oaicite:1]{index=1}
  ),

  // ───────── 2nd YEAR ─────────
  UpdateModel(
    title: "DBMS Assignment Format",
    description: "Official format for submissions.",
    year: "2",
    votes: 23,
    isDownload: true,
    link: "https://www.gtbit.ac.in/assets/img/pdf/DBMS%20ASSIGNMENTS_Merged_AIML.pdf", // DBMS assignments PDF :contentReference[oaicite:2]{index=2}
  ),
  UpdateModel(
    title: "Exam Date Announced",
    description: "Mid‑sem exams start from 3 Sept.",
    year: "2",
    votes: 37,
    isDownload: false,
    link: null,
  ),
  UpdateModel(
    title: "Operating‑System Notes",
    description: "All units — lecture notes PDF.",
    year: "2",
    votes: 61,
    isDownload: true,
    link: "https://sriindu.ac.in/wp-content/uploads/2023/10/R20CSE2202-OPERATING-SYSTEMS.pdf", // OS notes PDF :contentReference[oaicite:3]{index=3}
  ),

  // ───────── 3rd YEAR ─────────
  UpdateModel(
    title: "AI Workshop Resources",
    description: "Slides + sample code bundle.",
    year: "3",
    votes: 48,
    isDownload: true,
    link: "https://teachingcommons.stanford.edu/sites/g/files/sbiybj27001/files/media/file/defining-ai-chatbots-workshop-kit-slides-notes-pdf_0.pdf", // AI workshop slides PDF :contentReference[oaicite:4]{index=4}
  ),
  UpdateModel(
    title: "Mock Placement Test",
    description: "Aptitude test on Friday 11 AM.",
    year: "3",
    votes: 32,
    isDownload: false,
    link: null,
  ),
  UpdateModel(
    title: "DAA Notes",
    description: "Quick‑revision lecture notes.",
    year: "3",
    votes: 29,
    isDownload: true,
    link: "https://vssut.ac.in/lecture_notes/lecture1428551222.pdf", // DAA notes PDF :contentReference[oaicite:5]{index=5}
  ),

  // ───────── 4th YEAR ─────────
  UpdateModel(
    title: "Final‑Year Project Template",
    description: "Official FYP report template.",
    year: "4",
    votes: 66,
    isDownload: true,
    link: "https://core.ac.uk/download/pdf/59773112.pdf", // FYP template PDF :contentReference[oaicite:6]{index=6}
  ),
  UpdateModel(
    title: "Internship Offer Deadline",
    description: "Submit preferences before 8 Oct.",
    year: "4",
    votes: 40,
    isDownload: false,
    link: null,
  ),
  UpdateModel(
    title: "Thesis Format",
    description: "LaTeX & Word thesis‑format guide.",
    year: "4",
    votes: 57,
    isDownload: true,
    link: "https://www.vu.edu.au/sites/default/files/research/pdfs/thesis-template.pdf", // thesis format PDF :contentReference[oaicite:7]{index=7}
  ),
];
