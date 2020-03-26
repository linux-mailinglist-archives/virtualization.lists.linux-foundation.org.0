Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242E194557
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 18:22:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BEDAE8877D;
	Thu, 26 Mar 2020 17:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Y-i8sWS0KhE; Thu, 26 Mar 2020 17:22:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D87B886E5;
	Thu, 26 Mar 2020 17:22:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D107C0177;
	Thu, 26 Mar 2020 17:22:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 338B0C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 17:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1A70C886B3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 17:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQEvQdYwP9ds
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 17:21:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8EDF987F53
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 17:21:56 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0A4900B0CADCDCA21F3A81.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:4900:b0ca:dcdc:a21f:3a81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 39C621EC0CAA;
 Thu, 26 Mar 2020 18:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1585243313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=sPJE5svxHvBmq51+EaTp3ZPzDgvJ7fIYIPxDB6I8gHI=;
 b=Y5HeB5F6wdw/zJwmecTIz9gJGja20j774c7OHiUiBE2Tt/6vCalxLkOwJviDZMhNw4JOzb
 Hbvi4mk3wJkrxnq2uc5miovGJn3N0ugzYEeSdcrR1lK2u+TTxqk3gYhI+W6kgiyr2GAPGy
 PsSp3C6J5TVm8vUv0cCqjzdLhj9pbzE=
Date: Thu, 26 Mar 2020 18:21:46 +0100
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 06/70] x86/umip: Factor out instruction fetch
Message-ID: <20200326172146.GF11398@zn.tnic>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-7-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319091407.1481-7-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Mar 19, 2020 at 10:13:03AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Factor out the code to fetch the instruction from user-space to a helper
> function.

Add "No functional changes." here.

> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/include/asm/insn-eval.h |  2 ++
>  arch/x86/kernel/umip.c           | 26 +++++-----------------
>  arch/x86/lib/insn-eval.c         | 38 ++++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+), 20 deletions(-)

...

> +int insn_fetch_from_user(struct pt_regs *regs,
> +			 unsigned char buf[MAX_INSN_SIZE])

No need for that linebreak - fits in 80 cols.

> +{
> +	unsigned long seg_base = 0;
> +	int not_copied;
> +
> +	/*
> +	 * If not in user-space long mode, a custom code segment could be in
> +	 * use. This is true in protected mode (if the process defined a local
> +	 * descriptor table), or virtual-8086 mode. In most of the cases
> +	 * seg_base will be zero as in USER_CS.
> +	 */
> +	if (!user_64bit_mode(regs))
> +		seg_base = insn_get_seg_base(regs, INAT_SEG_REG_CS);
> +
> +	if (seg_base == -1L)
> +		return 0;

This reads strange: seg_base is changed only inside that if test so I
guess we could test it there too:

        if (!user_64bit_mode(regs)) {
                seg_base = insn_get_seg_base(regs, INAT_SEG_REG_CS);
                if (seg_base == -1L)
                        return 0;
        }

which is a small enough change to not require a separate patch.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
