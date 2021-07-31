Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7993DC463
	for <lists.virtualization@lfdr.de>; Sat, 31 Jul 2021 09:18:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11AFB606E6;
	Sat, 31 Jul 2021 07:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0lNx5PzgWXc; Sat, 31 Jul 2021 07:18:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EFCD66072A;
	Sat, 31 Jul 2021 07:18:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E8FEC0010;
	Sat, 31 Jul 2021 07:18:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B056C0010
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 07:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B2E683BCE
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 07:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="SIZqtvPz";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="W5JnI93A"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLffAy51_RYw
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 07:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EC9A83BC8
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 07:18:52 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C982C221EC;
 Sat, 31 Jul 2021 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627715930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WYXKdOA0fBvv3pT9/gbt1KAOZlZXQo7vqAE3CEoQmhc=;
 b=SIZqtvPzmOG/Ra46XoIlPdRUWTuUFNuTDrzOMC50MSV4nxIMkY5X4fyufS4wSZ25YIqksq
 KyNFHPZL6TJLku52OIdWlXz7sly68sLZKaWjTRandjx8g52RO0N39dvaz7FAIO7aMWMavo
 qmJJ/cdDK69bA4jpapVwzUKN0oEkU74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627715930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WYXKdOA0fBvv3pT9/gbt1KAOZlZXQo7vqAE3CEoQmhc=;
 b=W5JnI93AVF4zlV18NHpo6fRUwu6MQgLRiKthCmKHv0li9fxNDaTCx2VrYtLlIcSEbgagVh
 1LnIRyxI9ZxFaTAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0524B1368F;
 Sat, 31 Jul 2021 07:18:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id eWMiO1n5BGG4OQAAGKfGzw
 (envelope-from <jroedel@suse.de>); Sat, 31 Jul 2021 07:18:49 +0000
Date: Sat, 31 Jul 2021 09:18:48 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 04/12] x86/sev: Do not hardcode GHCB protocol version
Message-ID: <YQT5WPANjqXSytPR@suse.de>
References: <20210721142015.1401-1-joro@8bytes.org>
 <20210721142015.1401-5-joro@8bytes.org>
 <1eef6235-a8d0-1012-969e-ef6f0804d054@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1eef6235-a8d0-1012-969e-ef6f0804d054@amd.com>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Martin Radev <martin.b.radev@gmail.com>, Kees Cook <keescook@chromium.org>,
 Cfir Cohen <cfir@google.com>, linux-coco@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Erdem Aktas <erdemaktas@google.com>
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

Hi Tom,

On Wed, Jul 21, 2021 at 04:17:38PM -0500, Tom Lendacky wrote:
> On 7/21/21 9:20 AM, Joerg Roedel wrote:
> >  	/* Fill in protocol and format specifiers */
> > -	ghcb->protocol_version = GHCB_PROTOCOL_MAX;
> > +	ghcb->protocol_version = sev_get_ghcb_proto_ver();
> 
> So this probably needs better clarification in the spec, but the GHCB
> version field is for the GHCB structure layout. So if you don't plan to
> use the XSS field that was added for version 2 of the layout, then you
> should report the GHCB structure version as 1.

Yeah, this makes sense, exept for the struct field-name ;) But anyway, I
keep the version field at 1 for now.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
