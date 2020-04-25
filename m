Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A1B1B8873
	for <lists.virtualization@lfdr.de>; Sat, 25 Apr 2020 20:15:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 140CF86717;
	Sat, 25 Apr 2020 18:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ObN6YOu8xsjn; Sat, 25 Apr 2020 18:15:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 561E18671E;
	Sat, 25 Apr 2020 18:15:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46879C0175;
	Sat, 25 Apr 2020 18:15:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA039C0175
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 18:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D8BDB20347
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 18:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5Wq7g7CsWBD
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 18:15:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id A403D20337
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 18:15:49 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27EEA20728
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587838549;
 bh=cVK0toJnn9vOB9E2SmO9CBJWGgOYMugNbByNAh8ilkI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Td1w4w4h9ChWYz5sxGi7UkXFmK/KIcZI+NzSE/qXy5EHXewGWv3PHpGP8/taXuTC8
 uWk+vEI7eTXTaXz696KMMjIcufWpDhgIKKqdFCb7AYkGEgWEYvLqqKw19we/BmxCNY
 FwvAGN5IfcSyhd4VsaVVYwDtAW54CWFlJnBsZaMo=
Received: by mail-wr1-f54.google.com with SMTP id f13so15469283wrm.13
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 11:15:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ/M2G+WbYT9p/qfrY3YZFysLvo8pLlmgm+uZaZbsbuwrYyn4QN
 Dgio92KSY70AfvRzYhVspGE/43UvWSaOYNOltIGKTw==
X-Google-Smtp-Source: APiQypJ7rU7AYr+libqeVqePFVrceb06kci8UbSVnmOb7FS/p9cPbc3OPMNaylAH0ECs1JdRARhF0f+awt47YIcfzuo=
X-Received: by 2002:adf:f648:: with SMTP id x8mr17727377wrp.257.1587838547579; 
 Sat, 25 Apr 2020 11:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200319091407.1481-56-joro@8bytes.org>
 <20200424210316.848878-1-mstunes@vmware.com>
 <2c49061d-eb84-032e-8dcb-dd36a891ce90@intel.com>
 <ead88d04-1756-1190-2b37-b24f86422595@amd.com>
 <4d2ac222-a896-a60e-9b3c-b35aa7e81a97@intel.com>
 <20200425124909.GO30814@suse.de>
In-Reply-To: <20200425124909.GO30814@suse.de>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 25 Apr 2020 11:15:35 -0700
X-Gmail-Original-Message-ID: <CALCETrWCiMkA37yf972h+fqsz1_dbfye8AbrkJxDPJzC+1PBEw@mail.gmail.com>
Message-ID: <CALCETrWCiMkA37yf972h+fqsz1_dbfye8AbrkJxDPJzC+1PBEw@mail.gmail.com>
Subject: Re: [PATCH] Allow RDTSC and RDTSCP from userspace
To: Joerg Roedel <jroedel@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, X86 ML <x86@kernel.org>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andrew Lutomirski <luto@kernel.org>,
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

On Sat, Apr 25, 2020 at 5:49 AM Joerg Roedel <jroedel@suse.de> wrote:
>
> Hi Dave,
>
> On Fri, Apr 24, 2020 at 03:53:09PM -0700, Dave Hansen wrote:
> > Ahh, so any instruction that can have an instruction intercept set
> > potentially needs to be able to tolerate a #VC?  Those instruction
> > intercepts are under the control of the (untrusted relative to the
> > guest) hypervisor, right?
> >
> > >From the main sev-es series:
> >
> > +#ifdef CONFIG_AMD_MEM_ENCRYPT
> > +idtentry vmm_communication     do_vmm_communication    has_error_code=1
> > +#endif
>
> The next version of the patch-set (which I will hopefully have ready
> next week) will have this changed. The #VC exception handler uses an IST
> stack and is set to paranoid=1 and shift_ist. The IST stacks for the #VC
> handler are only allocated when SEV-ES is active.

shift_ist is gross.  What's it for?  If it's not needed, I'd rather
not use it, and I eventually want to get rid of it for #DB as well.

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
