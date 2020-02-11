Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B4159076
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 14:53:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B6AEF8669F;
	Tue, 11 Feb 2020 13:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jH3KP2MAuxKq; Tue, 11 Feb 2020 13:53:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7ED3A863D9;
	Tue, 11 Feb 2020 13:53:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53D3FC07FE;
	Tue, 11 Feb 2020 13:53:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1FF8C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D193B8560B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBE5qOz9Nuz1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AE6B585608
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:15 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1222B528; Tue, 11 Feb 2020 14:53:07 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 05/62] x86/insn-decoder: Make inat-tables.c suitable for
 pre-decompression code
Date: Tue, 11 Feb 2020 14:51:59 +0100
Message-Id: <20200211135256.24617-6-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211135256.24617-1-joro@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

The inat-tables.c file has some arrays in it that contain pointers to
other arrays. These pointers need to be relocated when the kernel
image is moved to a different location.

The pre-decompression boot-code has no support for applying ELF
relocations, so initialize these arrays at runtime in the
pre-decompression code to make sure all pointers are correctly
initialized.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/tools/gen-insn-attr-x86.awk       | 50 +++++++++++++++++++++-
 tools/arch/x86/tools/gen-insn-attr-x86.awk | 50 +++++++++++++++++++++-
 2 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/arch/x86/tools/gen-insn-attr-x86.awk b/arch/x86/tools/gen-insn-attr-x86.awk
index a42015b305f4..af38469afd14 100644
--- a/arch/x86/tools/gen-insn-attr-x86.awk
+++ b/arch/x86/tools/gen-insn-attr-x86.awk
@@ -362,6 +362,9 @@ function convert_operands(count,opnd,       i,j,imm,mod)
 END {
 	if (awkchecked != "")
 		exit 1
+
+	print "#ifndef __BOOT_COMPRESSED\n"
+
 	# print escape opcode map's array
 	print "/* Escape opcode map array */"
 	print "const insn_attr_t * const inat_escape_tables[INAT_ESC_MAX + 1]" \
@@ -388,6 +391,51 @@ END {
 		for (j = 0; j < max_lprefix; j++)
 			if (atable[i,j])
 				print "	["i"]["j"] = "atable[i,j]","
-	print "};"
+	print "};\n"
+
+	print "#else /* !__BOOT_COMPRESSED */\n"
+
+	print "/* Escape opcode map array */"
+	print "static const insn_attr_t *inat_escape_tables[INAT_ESC_MAX + 1]" \
+	      "[INAT_LSTPFX_MAX + 1];"
+	print ""
+
+	print "/* Group opcode map array */"
+	print "static const insn_attr_t *inat_group_tables[INAT_GRP_MAX + 1]"\
+	      "[INAT_LSTPFX_MAX + 1];"
+	print ""
+
+	print "/* AVX opcode map array */"
+	print "static const insn_attr_t *inat_avx_tables[X86_VEX_M_MAX + 1]"\
+	      "[INAT_LSTPFX_MAX + 1];"
+	print ""
+
+	print "static void inat_init_tables(void)"
+	print "{"
+
+	# print escape opcode map's array
+	print "\t/* Print Escape opcode map array */"
+	for (i = 0; i < geid; i++)
+		for (j = 0; j < max_lprefix; j++)
+			if (etable[i,j])
+				print "\tinat_escape_tables["i"]["j"] = "etable[i,j]";"
+	print ""
+
+	# print group opcode map's array
+	print "\t/* Print Group opcode map array */"
+	for (i = 0; i < ggid; i++)
+		for (j = 0; j < max_lprefix; j++)
+			if (gtable[i,j])
+				print "\tinat_group_tables["i"]["j"] = "gtable[i,j]";"
+	print ""
+	# print AVX opcode map's array
+	print "\t/* Print AVX opcode map array */"
+	for (i = 0; i < gaid; i++)
+		for (j = 0; j < max_lprefix; j++)
+			if (atable[i,j])
+				print "\tinat_avx_tables["i"]["j"] = "atable[i,j]";"
+
+	print "}"
+	print "#endif"
 }
 
diff --git a/tools/arch/x86/tools/gen-insn-attr-x86.awk b/tools/arch/x86/tools/gen-insn-attr-x86.awk
index a42015b305f4..af38469afd14 100644
--- a/tools/arch/x86/tools/gen-insn-attr-x86.awk
+++ b/tools/arch/x86/tools/gen-insn-attr-x86.awk
@@ -362,6 +362,9 @@ function convert_operands(count,opnd,       i,j,imm,mod)
 END {
 	if (awkchecked != "")
 		exit 1
+
+	print "#ifndef __BOOT_COMPRESSED\n"
+
 	# print escape opcode map's array
 	print "/* Escape opcode map array */"
 	print "const insn_attr_t * const inat_escape_tables[INAT_ESC_MAX + 1]" \
@@ -388,6 +391,51 @@ END {
 		for (j = 0; j < max_lprefix; j++)
 			if (atable[i,j])
 				print "	["i"]["j"] = "atable[i,j]","
-	print "};"
+	print "};\n"
+
+	print "#else /* !__BOOT_COMPRESSED */\n"
+
+	print "/* Escape opcode map array */"
+	print "static const insn_attr_t *inat_escape_tables[INAT_ESC_MAX + 1]" \
+	      "[INAT_LSTPFX_MAX + 1];"
+	print ""
+
+	print "/* Group opcode map array */"
+	print "static const insn_attr_t *inat_group_tables[INAT_GRP_MAX + 1]"\
+	      "[INAT_LSTPFX_MAX + 1];"
+	print ""
+
+	print "/* AVX opcode map array */"
+	print "static const insn_attr_t *inat_avx_tables[X86_VEX_M_MAX + 1]"\
+	      "[INAT_LSTPFX_MAX + 1];"
+	print ""
+
+	print "static void inat_init_tables(void)"
+	print "{"
+
+	# print escape opcode map's array
+	print "\t/* Print Escape opcode map array */"
+	for (i = 0; i < geid; i++)
+		for (j = 0; j < max_lprefix; j++)
+			if (etable[i,j])
+				print "\tinat_escape_tables["i"]["j"] = "etable[i,j]";"
+	print ""
+
+	# print group opcode map's array
+	print "\t/* Print Group opcode map array */"
+	for (i = 0; i < ggid; i++)
+		for (j = 0; j < max_lprefix; j++)
+			if (gtable[i,j])
+				print "\tinat_group_tables["i"]["j"] = "gtable[i,j]";"
+	print ""
+	# print AVX opcode map's array
+	print "\t/* Print AVX opcode map array */"
+	for (i = 0; i < gaid; i++)
+		for (j = 0; j < max_lprefix; j++)
+			if (atable[i,j])
+				print "\tinat_avx_tables["i"]["j"] = "atable[i,j]";"
+
+	print "}"
+	print "#endif"
 }
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
