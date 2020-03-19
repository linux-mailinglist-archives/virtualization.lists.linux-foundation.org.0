Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC3C18C249
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 22:28:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C54D588120;
	Thu, 19 Mar 2020 21:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uD8XAyOlKjGx; Thu, 19 Mar 2020 21:28:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D8F0E87DA2;
	Thu, 19 Mar 2020 21:28:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7692C07FF;
	Thu, 19 Mar 2020 21:28:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81505C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 21:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7870986E3F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 21:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFJVt-bb696E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 21:28:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 00E4086E3B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 21:28:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72255208C3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 21:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584653283;
 bh=wDHKIdt3Y3vhWUMG3wIbeCs2/G5gOP3qUw5RVSybfDM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C1zjTJmhscb/kf6Gr/fLaWAmP4m/XMANCnSraK8P22tZ6JgeDtk3jsSDi3+5i3oM3
 3WJXtWqGhmvVH1YYl8ntlKGNCat6JnlIwaR+8D+lFJ2u+MNgBOIBFv3BGQfc+CFBNG
 E/Trc2xBeKw4sqF1qJ75dnXSuaEg/zoAPhUQVf+g=
Received: by mail-wm1-f47.google.com with SMTP id c187so4377693wme.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 14:28:03 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2CO7ztVGXNa3Uf9uXWlj04f/IKDxqrlYelg6hu6Nmh9fG2gbse
 uaUTNZHx38xVIBA/K+qSqh+N887rc/997UhBT2MYLQ==
X-Google-Smtp-Source: ADFU+vsvB9VoJIoDZzFOfVxuD7/rCPKU+f9sriFcY/X3u9oBR64jUTo/lMsKf9lnZUULp+cTivEl1BA/XJfEY/2Kd9c=
X-Received: by 2002:a1c:b0c3:: with SMTP id z186mr5806142wme.36.1584653281734; 
 Thu, 19 Mar 2020 14:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-71-joro@8bytes.org>
 <CALCETrUOQneBHjoZkP-7T5PDijb=WOyv7xF7TD0GLR2Aw77vyA@mail.gmail.com>
 <20200319160749.GC5122@8bytes.org>
 <CALCETrXY5M87C1Fc3QvTkc6MdbQ_3gAuOPUeWJktAzK4T60QNQ@mail.gmail.com>
 <20200319192654.GD611@suse.de>
In-Reply-To: <20200319192654.GD611@suse.de>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 19 Mar 2020 14:27:49 -0700
X-Gmail-Original-Message-ID: <CALCETrXzyUGjPYBR_NDSvTG8TqLuQP2Q+v_mwXPne4O0U-18NA@mail.gmail.com>
Message-ID: <CALCETrXzyUGjPYBR_NDSvTG8TqLuQP2Q+v_mwXPne4O0U-18NA@mail.gmail.com>
Subject: Re: [PATCH 70/70] x86/sev-es: Add NMI state tracking
To: Joerg Roedel <jroedel@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

On Thu, Mar 19, 2020 at 12:26 PM Joerg Roedel <jroedel@suse.de> wrote:
>
> On Thu, Mar 19, 2020 at 11:40:39AM -0700, Andy Lutomirski wrote:
>
> > Nope.  A nested NMI will reset the interrupted NMI's return frame to
> > cause it to run again when it's done.  I don't think this will have
> > any real interaction with #VC.  There's no longjmp() here.
>
> Ahh, so I misunderstood that part, in this case your proposal of sending
> the NMI-complete message right at the beginning of do_nmi() should work
> just fine. I will test this and see how it works out.
>
> > I certainly *like* preventing nesting, but I don't think we really
> > want a whole alternate NMI path just for a couple of messed-up AMD
> > generations.  And the TF trick is not so pretty either.
>
> Indeed, if it could be avoided, it should.
>
> >
> > > > This causes us to pop the NMI frame off the stack.  Assuming the NMI
> > > > restart logic is invoked (which is maybe impossible?), we get #DB,
> > > > which presumably is actually delivered.  And we end up on the #DB
> > > > stack, which might already have been in use, so we have a potential
> > > > increase in nesting.  Also, #DB may be called from an unexpected
> > > > context.
> > >
> > > An SEV-ES hypervisor is required to intercept #DB, which means that the
> > > #DB exception actually ends up being a #VC exception. So it will not end
> > > up on the #DB stack.
> >
> > With your patch set, #DB doesn't seem to end up on the #DB stack either.
>
> Right, it does not use the #DB stack or shift-ist stuff. Maybe it
> should, is this needed for anything else than making entry code
> debugable by kgdb?

AIUI the shift-ist stuff is because we aren't very good about the way
that we handle tracing right now, and that can cause a limited degree
of recursion.  #DB uses IST for historical reasons that don't
necessarily make sense.  Right now, we need it for only one reason:
the MOV SS issue.  IIRC this isn't actually triggerable without
debugging enabled -- MOV SS with no breakpoint but TF on doesn't seem
to malfunction quite as badly.

--Andy

>
> Regards,
>
>         Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
