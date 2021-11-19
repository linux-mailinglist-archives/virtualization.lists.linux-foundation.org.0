Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE33456BBA
	for <lists.virtualization@lfdr.de>; Fri, 19 Nov 2021 09:37:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6B1060A6E;
	Fri, 19 Nov 2021 08:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mj1W5UkYo4JU; Fri, 19 Nov 2021 08:37:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8054061BDA;
	Fri, 19 Nov 2021 08:37:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE074C0036;
	Fri, 19 Nov 2021 08:36:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0953C0012
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Nov 2021 08:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 882A9404C4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Nov 2021 08:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="JRNnkaQG";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="/XMlDqKR"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipMtIKEV4NbP
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Nov 2021 08:36:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E7AE400DF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Nov 2021 08:36:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9C6FD1FD39;
 Fri, 19 Nov 2021 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637311013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ks9COcNFxKQzgqXBap70A20Sb9cIEMl/0mhoBpeYJoo=;
 b=JRNnkaQGN5QYi0vFk1Ex6ce2Dkdg3gwiEMIlHJwoDzJUtisX9oYdNI9KqJ14TrUbdvgKSv
 kwjsN76l49WoRyTAOmyoBy84x0cNI1dVX4HwnbVMisoY0dbfYeqoXKwOwQD+bU/rw+Vtsy
 0fyDO2jQcA/SbTKpZB9QR4d+vEN83sI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637311013;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ks9COcNFxKQzgqXBap70A20Sb9cIEMl/0mhoBpeYJoo=;
 b=/XMlDqKR6OdLGXBTh+U2C1baAjQSEVpEoFuGEcdQ/aFa/BnAI2CMphO28C/mJDT4XjkAEo
 yiICY0cb4vwwTQAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 105D813DD5;
 Fri, 19 Nov 2021 08:36:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K3v8ASVil2ESXgAAMHmgww
 (envelope-from <jroedel@suse.de>); Fri, 19 Nov 2021 08:36:53 +0000
Date: Fri, 19 Nov 2021 09:36:51 +0100
From: Joerg Roedel <jroedel@suse.de>
To: Michael Sterritt <sterritt@google.com>
Subject: Re: [PATCH] Fix SEV-ES INS/OUTS instructions for word, dword, and
 qword.
Message-ID: <YZdiI8N4+6Xt5b++@suse.de>
References: <20211118021326.4134850-1-sterritt@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211118021326.4134850-1-sterritt@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, marcorr@google.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-coco@lists.linux.dev, pgonda@google.com,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Michael,

On Wed, Nov 17, 2021 at 06:13:26PM -0800, Michael Sterritt wrote:
> Properly type the operands being passed to __put_user()/__get_user().
> Otherwise, these routines truncate data for dependent instructions
> (e.g., INSW) and only read/write one byte.
> =

> Tested: Tested by sending a string with `REP OUTSW` to a port and then
> reading it back in with `REP INSW` on the same port. Previous behavior
> was to only send and receive the first char of the size. For example,
> word operations for "abcd" would only read/write "ac". With change, the
> full string is now written and read back.

Thanks for fixing this! When you re-send, please change the subject to

	x86/sev-es: Fix SEV-ES INS/OUTS instructions for word, dword, and qword

Regards,

-- =

J=F6rg R=F6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=FCrnberg
Germany
 =

(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Ivo Totev

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
