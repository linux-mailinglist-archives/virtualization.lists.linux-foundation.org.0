Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CF1129FF0
	for <lists.virtualization@lfdr.de>; Tue, 24 Dec 2019 11:04:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E960F203ED;
	Tue, 24 Dec 2019 10:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynf-YfylpV+7; Tue, 24 Dec 2019 10:04:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F1A3F203C4;
	Tue, 24 Dec 2019 10:04:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C60CDC0881;
	Tue, 24 Dec 2019 10:04:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 441FCC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 10:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2BEE18329B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 10:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0YjYgVFaNrz
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 10:04:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D22F08300C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 10:04:31 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0ED600E4E5C00CE9FEB53D.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:d600:e4e5:c00c:e9fe:b53d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 47AE31EC0273;
 Tue, 24 Dec 2019 11:04:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1577181868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=lZBp7WJCTDYPOomy6Za4skPEqciE2e9sbtVlgHLZuQw=;
 b=F7NfYjT8T7RuQTVZZX4JYza98gxXNuJUZSmRdHlZ12yiRY3KZJgYpmHVLQEFgOXjwQ5QCy
 1MFaouSTNo2iWf5/mbdUyCgmtdmVAYiNH0Ulj8Ci2/PlEXzNg8dFZvEBKlzjSehTG9UuR6
 3QEBi6606+OQuFC3xIJ5Ft4HG7Fk0eY=
Date: Tue, 24 Dec 2019 11:04:23 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v10 10/11] x86/paravirt: Adapt assembly for PIE support
Message-ID: <20191224100423.GC21017@zn.tnic>
References: <20191205000957.112719-1-thgarnie@chromium.org>
 <20191205000957.112719-11-thgarnie@chromium.org>
 <20191223172350.GH16710@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191223172350.GH16710@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 keescook@chromium.org, kernel-hardening@lists.openwall.com, "VMware,
 Inc." <pv-drivers@vmware.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kristen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>
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

On Mon, Dec 23, 2019 at 06:23:50PM +0100, Borislav Petkov wrote:
> On Wed, Dec 04, 2019 at 04:09:47PM -0800, Thomas Garnier wrote:
> > If PIE is enabled, switch the paravirt assembly constraints to be
> > compatible. The %c/i constrains generate smaller code so is kept by
> > default.
> > 
> > Position Independent Executable (PIE) support will allow to extend the
> > KASLR randomization range below 0xffffffff80000000.
> > 
> > Signed-off-by: Thomas Garnier <thgarnie@chromium.org>
> > Acked-by: Juergen Gross <jgross@suse.com>
> > ---
> >  arch/x86/include/asm/paravirt_types.h | 32 +++++++++++++++++++++++----
> >  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> More missed feedback:
> 
> https://lkml.kernel.org/r/CAJcbSZG-JhBC9b1JMv1zq2r5uRQipYLtkNjM67sd7=eqy_iOaA@mail.gmail.com

Whoops, it is in the comment above PARAVIRT_CALL_POST. I must've been
blind yesterday. Forget what I said and sorry.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
