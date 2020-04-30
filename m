Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F011C028E
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 18:32:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4308D88789;
	Thu, 30 Apr 2020 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTXlnefUvpCN; Thu, 30 Apr 2020 16:32:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6BE788724;
	Thu, 30 Apr 2020 16:32:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82FACC016F;
	Thu, 30 Apr 2020 16:32:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 024C4C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 16:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DA2A188724
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 16:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUIBwm9N4cgv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 16:32:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 58EE388659
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 16:32:05 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0C30002976151CE84103F8.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:3000:2976:151c:e841:3f8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 65B371EC0CDD;
 Thu, 30 Apr 2020 18:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1588264322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=xtrl8gxWZkJHYpJPr/Cwo7b9vip/S9DDjXd/Ww6io40=;
 b=f3DDPgJ1kb7J7H1s2FSo+CewgA8pebDywRzuhlHIbGoPeJfxOCoZPWUT+ddj94MkaVQxlQ
 4URcgx2vG/mZgL4VfGFpjsRWtkEb1XG8JwAu5rAjcmhGZfzgh28VgiyYLYxdqvX25H88lK
 rbvaFaro7cNsYsFFS5WTa0Uy8BMWKZI=
Date: Thu, 30 Apr 2020 18:31:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 08/75] x86/umip: Factor out instruction decoding
Message-ID: <20200430163155.GB3996@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-9-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-9-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
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

On Tue, Apr 28, 2020 at 05:16:18PM +0200, Joerg Roedel wrote:
> +/**
> + * insn_decode() - Decode an instruction
> + * @regs:	Structure with register values as seen when entering kernel mode
> + * @insn:	Structure to store decoded instruction
> + * @buf:	Buffer containing the instruction bytes
> + * @buf_size:   Number of instruction bytes available in buf
> + *
> + * Decodes the instruction provided in buf and stores the decoding results in
> + * insn. Also determines the correct address and operand sizes.
> + *
> + * Returns:
> + *
> + * True if instruction was decoded, False otherwise.
> + */
> +bool insn_decode(struct pt_regs *regs, struct insn *insn,
> +		 unsigned char buf[MAX_INSN_SIZE], int buf_size)

Right, let's have @insn be the first function argument in all those
insn-handling functions.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
