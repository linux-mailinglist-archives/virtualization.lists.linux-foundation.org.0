Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C318907C
	for <lists.virtualization@lfdr.de>; Tue, 17 Mar 2020 22:35:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D92E88A83;
	Tue, 17 Mar 2020 21:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DsuGQAg5SWRi; Tue, 17 Mar 2020 21:35:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1A8888A81;
	Tue, 17 Mar 2020 21:35:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FAB4C1D88;
	Tue, 17 Mar 2020 21:35:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27855C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 21:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EE1582035D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 21:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQC4OJ+U5YAO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 21:34:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id DE6DF203AC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 21:34:35 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6121E20770
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 21:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584480875;
 bh=FU6/YhzHCy5DWzCb2Jjd6xpKYKIlYfn0Nkn8S0an218=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aaAKrQvr1UPKXoqSl2Xez3aX9YvAC2YlC+m1eLZNTBLgDh8s1vRjXMcwG3x4vnBM5
 TTa5g/gdhOFRAZ1DFOxjMw7JMMKwzmTdHJS3CXSqETyMXBoHn2YbAFrjzXNVBR7bjQ
 lFXC0+JRfZOZDujzOCrU1X4Iz1w2OacosqTLJYCg=
Received: by mail-wr1-f43.google.com with SMTP id s1so5936331wrv.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 14:34:35 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0KQd2sKJ4MqnUxrsj6nEmvjp7kzFT3HV4GKL8gKP0jiHJHun0d
 TMQYW/hGh9/0X2p22KogKsvS7f5AwYX9WIJvThPG3A==
X-Google-Smtp-Source: ADFU+vtGXARxy1KWOouUhaZnISUK705uJFt7DrOok2Eu+G2fu4TjnS61RAdWYoQTjxk7jomgV/TRyqL9G7ZtF7EGMwA=
X-Received: by 2002:adf:9dc6:: with SMTP id q6mr1062310wre.70.1584480873869;
 Tue, 17 Mar 2020 14:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-39-joro@8bytes.org>
 <CALCETrVRmg88xY0s4a2CONXQ3fgvCKXpW2eYJRJGhqQLneoGqQ@mail.gmail.com>
 <20200313091221.GA16378@suse.de>
In-Reply-To: <20200313091221.GA16378@suse.de>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 17 Mar 2020 14:34:22 -0700
X-Gmail-Original-Message-ID: <CALCETrX74dJEXd7OxZZ=2sPy8nOjqO5Lzjt04VrxP0TYgTXnUg@mail.gmail.com>
Message-ID: <CALCETrX74dJEXd7OxZZ=2sPy8nOjqO5Lzjt04VrxP0TYgTXnUg@mail.gmail.com>
Subject: Re: [PATCH 38/62] x86/sev-es: Handle instruction fetches from
 user-space
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

On Fri, Mar 13, 2020 at 2:12 AM Joerg Roedel <jroedel@suse.de> wrote:
>
> On Wed, Feb 12, 2020 at 01:42:48PM -0800, Andy Lutomirski wrote:
> > I realize that this is a somewhat arbitrary point in the series to
> > complain about this, but: the kernel already has infrastructure to
> > decode and fix up an instruction-based exception.  See
> > fixup_umip_exception().  Please refactor code so that you can share
> > the same infrastructure rather than creating an entirely new thing.
>
> Okay, but 'infrastructure' is a bold word for the call path down
> fixup_umip_exception().

I won't argue with that.

> It uses the in-kernel instruction decoder, which
> I already use in my patch-set. But I agree that some code in this
> patch-set is duplicated and already present in the instruction decoder,
> and that fixup_umip_exception() has more robust instruction decoding.
>
> I factor the instruction decoding part out and make is usable for the
> #VC handler too and remove the code that is already present in the
> instruction decoder.

Thanks!

>
> Regards,
>
>         Joerg
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
