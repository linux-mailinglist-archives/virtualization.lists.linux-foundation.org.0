Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE916644F6
	for <lists.virtualization@lfdr.de>; Tue, 10 Jan 2023 16:34:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2874C81DF8;
	Tue, 10 Jan 2023 15:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2874C81DF8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jscmkisD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqvSB2cXVKsS; Tue, 10 Jan 2023 15:34:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0D37481E4F;
	Tue, 10 Jan 2023 15:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D37481E4F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B024C0078;
	Tue, 10 Jan 2023 15:34:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E6C8C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 15:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24E3340B58
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 15:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24E3340B58
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=jscmkisD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltDaQjIU69-r
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 15:34:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45A9A40B68
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45A9A40B68
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 15:34:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EAF86178A;
 Tue, 10 Jan 2023 15:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DD1C433D2;
 Tue, 10 Jan 2023 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673364876;
 bh=6eMAM8CalZFNY38f3ldCsno9tHpWRfBLPgZ1YfpCMmo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=jscmkisDJxTebLylCVCm1Pb4G3WCpEwNFs8001RP3PCeo1eOo8bYHl2kVPjDjD7+l
 E5UXDQzwEdvYgZW6lXCJ5NSEDySgm2/FNsfYFwue2rMyslfKibqYdQ+gGr1EQhSRLd
 7RHjUf/O0ig8Fu9oF9evoswPGvrt+W9o99Kwa+x6qjBEGgmSqFf5YcUoTU4qwpUJSw
 3XYaJX5Vp6sVMnD2u61ZGVBqywHNQ02MfZvayXLNwolWaAeLrpZtU5n7NcfyaZVCHA
 az16CVt3ezyajpt8LDI8WAvzEo129fVERifXJYTZiENrHQ/BsJUTEhNI2WaxAWdvoo
 wGCYV5JcgOf9A==
Date: Tue, 10 Jan 2023 09:34:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Subject: Re: [PATCH v8 1/3] PCI: Add SolidRun vendor ID
Message-ID: <20230110153434.GA1505598@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109080453.1155113-1-alvaro.karsz@solid-run.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, Jan 09, 2023 at 10:04:53AM +0200, Alvaro Karsz wrote:
> Add SolidRun vendor ID to pci_ids.h
> 
> The vendor ID is used in 2 different source files,
> the SNET vDPA driver and PCI quirks.

Nits: wrap to fill 75 columns.

> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  include/linux/pci_ids.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index b362d90eb9b..9a3102e61db 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -3092,6 +3092,8 @@
> 
>  #define PCI_VENDOR_ID_3COM_2		0xa727
> 
> +#define PCI_VENDOR_ID_SOLIDRUN          0xd063

This should be indented with tabs instead of spaces so it matches the
rest of the file.

It's helpful if you can send the patches in a series so the individual
patches are replies to the cover letter.  That makes tools and
archives work better:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/5.Posting.rst?id=v6.1#n342
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
