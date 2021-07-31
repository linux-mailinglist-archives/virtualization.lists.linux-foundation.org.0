Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A56F93DC462
	for <lists.virtualization@lfdr.de>; Sat, 31 Jul 2021 09:17:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE44640458;
	Sat, 31 Jul 2021 07:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WNcaVo05CNE; Sat, 31 Jul 2021 07:17:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B58A4404D4;
	Sat, 31 Jul 2021 07:17:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 342CFC001F;
	Sat, 31 Jul 2021 07:17:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE51C0010
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 07:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14965606E6
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 07:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="lAxg8F6V";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="Hynwo4vV"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PD02TFYVU7R5
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 07:17:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3216B606CB
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 07:17:43 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DCE38221E7;
 Sat, 31 Jul 2021 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627715859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kyM9js2aRHyfGQiZvaRI/san3KM6xq/gaboX810m66s=;
 b=lAxg8F6VD+4AnPsG/mMhP3TjLl40VG23Kmwg7lgnscQBVXujxipnB1sRvy5Fwphgzm4MTl
 QqLgOnsZRhK9HeWuIQ56QyuwQZemhPbKhqTsuyhMYUqkwt8qCMn0O9ZG91clmhv3fuJxJ0
 LJjlecCWVAS8I36UubMgskseBux/bCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627715859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kyM9js2aRHyfGQiZvaRI/san3KM6xq/gaboX810m66s=;
 b=Hynwo4vVVOPM1dP9PH0k9MPz4dgRUYk0yb4mOQgcejQs4gUNDFuPN/RU9Xx9dWthWdCdVJ
 dBCyAXx0G9H401CA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0EF0D1368F;
 Sat, 31 Jul 2021 07:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id jptYARP5BGF3OQAAGKfGzw
 (envelope-from <jroedel@suse.de>); Sat, 31 Jul 2021 07:17:39 +0000
Date: Sat, 31 Jul 2021 09:17:37 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 11/12] x86/sev: Handle CLFLUSH MMIO events
Message-ID: <YQT5Ec5M6maZdFoO@suse.de>
References: <20210721142015.1401-1-joro@8bytes.org>
 <20210721142015.1401-12-joro@8bytes.org>
 <YQSAVo0CXUKHXdLF@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQSAVo0CXUKHXdLF@google.com>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Kees Cook <keescook@chromium.org>,
 Cfir Cohen <cfir@google.com>, linux-coco@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Biederman <ebiederm@xmission.com>, Erdem Aktas <erdemaktas@google.com>
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

Hi Sean,

On Fri, Jul 30, 2021 at 10:42:30PM +0000, Sean Christopherson wrote:
> On Wed, Jul 21, 2021, Joerg Roedel wrote:
> This wording can be misread as "the hypervisor is responsible for _all_ cache
> management".  Maybe just:
> 
> 		/*
> 		 * Ignore CLFLUSHes - the hyperivsor is responsible for cache
> 		 * management of emulated MMIO.
> 		 */

Right, will update the comment, thanks.

> Side topic, out of curisoity, what's mapping/accessing emulated MMIO as non-UC?

The CLFLUSHes happen when the kexec'ed kernel maps the VGA framebuffer
as unencrypted. Initially it is mapped encrypted and before re-mapping
the kernel flushes the range from the caches.

I have not investigated why this doesn't happen on the first boot,
though.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
