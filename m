Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF83BA00C
	for <lists.virtualization@lfdr.de>; Fri,  2 Jul 2021 13:48:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4E2F60B5A;
	Fri,  2 Jul 2021 11:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWzymqa4cGz5; Fri,  2 Jul 2021 11:48:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 80B6460B6C;
	Fri,  2 Jul 2021 11:48:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63AC5C0025;
	Fri,  2 Jul 2021 11:48:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CB90C0010
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 11:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 698D140232
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 11:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com header.b="N1vYjPTk";
 dkim=pass (1024-bit key) header.d=suse.com header.b="N1vYjPTk"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWy-ToB2jXRZ
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 11:48:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73803401F4
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 11:48:51 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A1A7820559;
 Fri,  2 Jul 2021 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1625226529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eC9zp1q36Ee/jP4TtRNuvYFMVVhl5Tzhsv3C+E9+clA=;
 b=N1vYjPTkNMmBGoewtUUjTnRF7u9M5swnA/bBnNvNo3Oh8+Pz3QSTdVEd5kGkFfJOfLZdge
 foWtDCeJ3MvSQfcTp0LHyEy2JAB/5/L3MSBzVSAEp/zfYtd0B/KrpmkSIktTGIeSAISxHi
 fZslf93tVQdGdu+llip7XG0j8k8llck=
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 41F0311C84;
 Fri,  2 Jul 2021 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1625226529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eC9zp1q36Ee/jP4TtRNuvYFMVVhl5Tzhsv3C+E9+clA=;
 b=N1vYjPTkNMmBGoewtUUjTnRF7u9M5swnA/bBnNvNo3Oh8+Pz3QSTdVEd5kGkFfJOfLZdge
 foWtDCeJ3MvSQfcTp0LHyEy2JAB/5/L3MSBzVSAEp/zfYtd0B/KrpmkSIktTGIeSAISxHi
 fZslf93tVQdGdu+llip7XG0j8k8llck=
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0PlUDiH93mDDDAAALh3uQQ
 (envelope-from <varad.gautam@suse.com>); Fri, 02 Jul 2021 11:48:49 +0000
To: kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: [kvm-unit-tests PATCH 4/6] x86: efi_main: Self-relocate ELF .dynamic
 addresses
Date: Fri,  2 Jul 2021 13:48:18 +0200
Message-Id: <20210702114820.16712-5-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210702114820.16712-1-varad.gautam@suse.com>
References: <20210702114820.16712-1-varad.gautam@suse.com>
MIME-Version: 1.0
Cc: thomas.lendacky@amd.com, drjones@redhat.com, jroedel@suse.de,
 brijesh.singh@amd.com, pbonzini@redhat.com, bp@suse.de
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
From: Varad Gautam via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Varad Gautam <varad.gautam@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

EFI expects a relocatable PE, and the loader will patch in the
relocations from the COFF.

Since we are wrapping an ELF into a PE here, the EFI loader will
not handle ELF relocations, and we need to patch the ELF .dynamic
section manually on early boot.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 x86/efi_main.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/x86/efi_main.c b/x86/efi_main.c
index 237d4e7..be3f9ab 100644
--- a/x86/efi_main.c
+++ b/x86/efi_main.c
@@ -1,9 +1,13 @@
 #include <alloc_phys.h>
 #include <linux/uefi.h>
+#include <elf.h>
 
 unsigned long __efiapi efi_main(efi_handle_t handle, efi_system_table_t *sys_tab);
 efi_system_table_t *efi_system_table = NULL;
 
+extern char ImageBase;
+extern char _DYNAMIC;
+
 static void efi_free_pool(void *ptr)
 {
 	efi_bs_call(free_pool, ptr);
@@ -93,11 +97,70 @@ static efi_status_t exit_efi(void *handle)
 	return EFI_SUCCESS;
 }
 
+static efi_status_t elf_reloc(unsigned long image_base, unsigned long dynamic)
+{
+	long relsz = 0, relent = 0;
+	Elf64_Rel *rel = 0;
+	Elf64_Dyn *dyn = (Elf64_Dyn *) dynamic;
+	unsigned long *addr;
+	int i;
+
+	for (i = 0; dyn[i].d_tag != DT_NULL; i++) {
+		switch (dyn[i].d_tag) {
+		case DT_RELA:
+			rel = (Elf64_Rel *)
+				((unsigned long) dyn[i].d_un.d_ptr + image_base);
+			break;
+		case DT_RELASZ:
+			relsz = dyn[i].d_un.d_val;
+			break;
+		case DT_RELAENT:
+			relent = dyn[i].d_un.d_val;
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (!rel && relent == 0)
+		return EFI_SUCCESS;
+
+	if (!rel || relent == 0)
+		return EFI_LOAD_ERROR;
+
+	while (relsz > 0) {
+		/* apply the relocs */
+		switch (ELF64_R_TYPE (rel->r_info)) {
+		case R_X86_64_NONE:
+			break;
+		case R_X86_64_RELATIVE:
+			addr = (unsigned long *) (image_base + rel->r_offset);
+			*addr += image_base;
+			break;
+		default:
+			break;
+		}
+		rel = (Elf64_Rel *) ((char *) rel + relent);
+		relsz -= relent;
+	}
+	return EFI_SUCCESS;
+}
+
 unsigned long __efiapi efi_main(efi_handle_t handle, efi_system_table_t *sys_tab)
 {
+	unsigned long image_base, dyn;
 	efi_system_table = sys_tab;
 
 	exit_efi(handle);
 
+	image_base = (unsigned long) &ImageBase;
+	dyn = image_base + (unsigned long) &_DYNAMIC;
+
+	/* The EFI loader does not handle ELF relocations, so fixup
+	 * .dynamic addresses before proceeding any further. */
+	elf_reloc(image_base, dyn);
+
+	start64();
+
 	return 0;
 }
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
