Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 836251D0B5D
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 10:59:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1FD342046B;
	Wed, 13 May 2020 08:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oleJuOGUUKtS; Wed, 13 May 2020 08:59:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D39872045A;
	Wed, 13 May 2020 08:59:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF9E5C016F;
	Wed, 13 May 2020 08:59:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACE91C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 08:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9B5F387FB6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 08:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a7piOmEiJFYU
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 08:59:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 64F0587E58
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 08:59:34 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0AC300894BCC9D04A5BD62.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:c300:894b:cc9d:4a5:bd62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 785EA1EC0136;
 Wed, 13 May 2020 10:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1589360371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=4RZP0ufoz0xMdedmQ7FLg1ube16OaxgtjtyO0/udpG4=;
 b=Ykl2eku9gh8We+iYJnEuPaVAtAldLdXec6XrV0ltQtY6KsotghDRc6vJeOjQWYoMa5V/6y
 GA9bgjT+0Qn3nJJKizmzG1/EFRpGmgTYGmVtCDkiUCJTwatg6sRc3Ytbw3JnpHP9FQrJjS
 jAjTuAZ7aEXCouJy7lJfRAd9pmNGn8w=
Date: Wed, 13 May 2020 10:59:28 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <jroedel@suse.de>, Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v3 23/75] x86/boot/compressed/64: Setup GHCB Based VC
 Exception handler
Message-ID: <20200513085928.GB4025@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-24-joro@8bytes.org>
 <20200512181157.GD6859@zn.tnic> <20200512210812.GF8135@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512210812.GF8135@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, May 12, 2020 at 11:08:12PM +0200, Joerg Roedel wrote:
> No, this is a recent addition, otherwise this breaks out-of-tree builds
> (make O=/some/path ...) because inat-tables.c (included from inat.c) is
> generated during build and ends up in the $(objtree).

Please add a blurb about this above it otherwise no one would have a
clue why it is there.

> Because the immediate is the last part of the instruction which is
> decoded (even if there is no immediate). The .got field is set when
> either the immediate was decoded successfully or, in case the
> instruction has no immediate, when the rest of the instruction was
> decoded successfully. So testing immediate.got is the indicator whether
> decoding was successful.

Hm, whether the immediate was parsed correctly or it wasn't there and
using that as the sign whether the instruction was decoded successfully
sounds kinda arbitrary.

@Masami: shouldn't that insn_get_length() thing return a value to denote
whether the decode was successful or not instead of testing arbitrary
fields?

Pasting for you the code sequence again:

	...
        insn_get_length(&ctxt->insn);

        ret = ctxt->insn.immediate.got ? ES_OK : ES_DECODE_FAILED;
	...

I wonder if one would be able to do instead:

	if (insn_get_length(&ctxt->insn))
		return ES_OK;

	return ES_DECODE_FAILED;

to have it straight-forward...

> Probably better rename the function, it also does the sev-es protocol
> version negotiation and all other related setup tasks. Maybe
> sev_es_setup() is a better name?

Sure.

> If the above call fails its the end of the systems lifetime, because we
> can't continue to boot an SEV-ES guest when we have no GHCB.
> 
> BUG_ON() and friends are also not available in the pre-decompression
> boot stage.

Oh ok, error() does hlt the system.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
