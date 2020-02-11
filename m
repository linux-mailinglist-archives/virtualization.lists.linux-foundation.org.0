Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB5159BF8
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:12:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C51708683C;
	Tue, 11 Feb 2020 22:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9CpnhMHIgMp; Tue, 11 Feb 2020 22:12:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3AC9A86834;
	Tue, 11 Feb 2020 22:12:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 168F1C1D88;
	Tue, 11 Feb 2020 22:12:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F362DC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E284185344
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vp1c-6mXESx2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:12:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F00681F85
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:12:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCA0920848
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581459138;
 bh=yNqZod946paujAdEqMRJ1ejAWBjSCe4eeJhwXaauReA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CIBIe+lFFTrJtJr5PAHqlakYHlpJHZ8/IxM6nu6BnvrvP7QlnGB0UYifJ+cLbPD1u
 h1S/MFtkHV/kfSrWKBYyT33E1VvxImKO4GN0JxCZomOMAUqT1BPCihhCIlujCDaFTm
 +HfJXF6DSOj/kVMp23bh1nYVKiS1eqyxL1JzNMCc=
Received: by mail-wr1-f47.google.com with SMTP id u6so14563496wrt.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:12:17 -0800 (PST)
X-Gm-Message-State: APjAAAV345f8akaKiE4C30mCB0C0kopY0u04ZvVTBeO+dl0CDnsWjuiE
 kYFXHtfYdSLqV4rRFlHve+TX6koa+iclaE7MLmujWw==
X-Google-Smtp-Source: APXvYqx/FE/ZBM/IRE/iZmNcUdhlAsvuwyZQ8jxjO4FhrLlV/QjKqYE4nFeb7APUWZqWIeFWsWQE68sUQ55NIG/jAcY=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr10779334wrs.184.1581459136232; 
 Tue, 11 Feb 2020 14:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211145008.GT14914@hirez.programming.kicks-ass.net>
 <20200211154321.GB22063@8bytes.org>
In-Reply-To: <20200211154321.GB22063@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:12:04 -0800
X-Gmail-Original-Message-ID: <CALCETrUtvd0OuLoo=ZBRmaJRFxgFWV9hSZyHBwmWCs2+b4J-sg@mail.gmail.com>
Message-ID: <CALCETrUtvd0OuLoo=ZBRmaJRFxgFWV9hSZyHBwmWCs2+b4J-sg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/62] Linux as SEV-ES Guest Support
To: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Tue, Feb 11, 2020 at 7:43 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Tue, Feb 11, 2020 at 03:50:08PM +0100, Peter Zijlstra wrote:
>
> > Oh gawd; so instead of improving the whole NMI situation, AMD went and
> > made it worse still ?!?
>
> Well, depends on how you want to see it. Under SEV-ES an IRET will not
> re-open the NMI window, but the guest has to tell the hypervisor
> explicitly when it is ready to receive new NMIs via the NMI_COMPLETE
> message.  NMIs stay blocked even when an exception happens in the
> handler, so this could also be seen as a (slight) improvement.
>

I don't get it.  VT-x has a VMCS bit "Interruptibility
state"."Blocking by NMI" that tracks the NMI masking state.  Would it
have killed AMD to solve the problem they same way to retain
architectural behavior inside a SEV-ES VM?

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
