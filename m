Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B40502141D6
	for <lists.virtualization@lfdr.de>; Sat,  4 Jul 2020 00:53:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8AE1F88DF6;
	Fri,  3 Jul 2020 22:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCYdYrjDTEXE; Fri,  3 Jul 2020 22:53:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF82388E16;
	Fri,  3 Jul 2020 22:53:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81DCDC0733;
	Fri,  3 Jul 2020 22:53:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F092CC0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CEC7F2375C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1eBVZkAA1gH6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:53:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 7CAEF226D7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:53:33 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id b25so35098047ljp.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 15:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xCR5VvhKlbkEFM6sZwEPdCYNVIQ/fI7Y+3OKvD7Y5CE=;
 b=M7+yQAj4FyVF9DU+YNPXjKkVGTGKftdJcKKszBlVnX5aS/jz3jwzpl3oRMTykHtghk
 CMx1MmsupZzmxYmq0YdqHf4JFlGmU+ghnqWOKgIEdrvyFQ8Qa99a2FdkXrdi2Se/MLsL
 nlVcruJkxMDHASJOxyYFVac4TY50weNssjd+pcNnCBmcp3Oz3AkyGCqXTM+LdkZ0pRFo
 SJAmicXgGy4doAWU9fLljh5vtUNMBTr+DM4EVbJvY2Mmd+0/V3H4Ly/4mbVGWiUWaTQs
 5AIO+GujEt3x4dZHcu5ilq/o638RybF8ne644ndhtl4BYMHpGmDujSfX0aKEpdomjKD8
 kEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xCR5VvhKlbkEFM6sZwEPdCYNVIQ/fI7Y+3OKvD7Y5CE=;
 b=avxZ9RfIt/tVEYKIVArL4q0aMSlTiSSCjQB5x6eOcde9zY5N5QiAfx4Q2Era9bdyKw
 NuoYyp2suUTSqIhmVpFnVrYQF+ogZFt+bpFo2/tPga4tBvVCybEoFjVfyUDoelxpSw90
 A8JV26Gn1XvtuAdnE4XjjTzdwLoZpIkQb32jjw2i/agt+uede4/7FF/Y70uQG+1puCtY
 uqfuLysi5QmDVLpTvsneJmHuykJZ2ewbBBBgXd+quguTlWhIyn3csdHvDNKh9JLX6o4z
 /LuwTAbQLrbEmlbDwKgjDbJgqCVCL6wFzQVPEpsTqQrzFSBEyobnlUKGYzfpEFl/dP1R
 yO5Q==
X-Gm-Message-State: AOAM533IzoOiyHhAksKH6yNekukN7wJVouS/jI2SX0SadaTYP3C5kBrE
 oQHFQYFM/oME+LZyquX31W+CWoCu7MxlRPpFpnobPg==
X-Google-Smtp-Source: ABdhPJy0/d7YQxkDTsZvXO7ow32yFdRcjugFg1twpCSkcbrbcdxZ/z4wQIr7NksLBKL4GwroBCtrf1lXG19AlZ5fv5c=
X-Received: by 2002:a2e:9dcc:: with SMTP id x12mr4527117ljj.415.1593816811282; 
 Fri, 03 Jul 2020 15:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
 <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
 <20200703223453.GA25072@amd>
In-Reply-To: <20200703223453.GA25072@amd>
Date: Sat, 4 Jul 2020 00:53:04 +0200
Message-ID: <CAG48ez0JkDb84FD8xgpNmERhWcjqbZuXfWbxzmnkM_CH_mXAnQ@mail.gmail.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
To: Pavel Machek <pavel@ucw.cz>
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "mingo@kernel.org" <mingo@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 "Brooker, Marc" <mbrooker@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "bonzini@gnu.org" <bonzini@gnu.org>, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, "keescook@chromium.org" <keescook@chromium.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, "MacCarthaigh, Colm" <colmmacc@amazon.com>,
 "fweimer@redhat.com" <fweimer@redhat.com>,
 "wad@chromium.org" <wad@chromium.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "Manwaring,
 Derek" <derekmn@amazon.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "luto@amacapital.net" <luto@amacapital.net>, "Sandu,
 Andrei" <sandreim@amazon.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
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
From: Jann Horn via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sat, Jul 4, 2020 at 12:34 AM Pavel Machek <pavel@ucw.cz> wrote:
> On Fri 2020-07-03 15:29:22, Jann Horn wrote:
> > On Fri, Jul 3, 2020 at 1:30 PM Michal Hocko <mhocko@kernel.org> wrote:
> > > On Fri 03-07-20 10:34:09, Catangiu, Adrian Costin wrote:
> > > > This patch adds logic to the kernel power code to zero out contents of
> > > > all MADV_WIPEONSUSPEND VMAs present in the system during its transition
> > > > to any suspend state equal or greater/deeper than Suspend-to-memory,
> > > > known as S3.
> > >
> > > How does the application learn that its memory got wiped? S2disk is an
> > > async operation and it can happen at any time during the task execution.
> > > So how does the application work to prevent from corrupted state - e.g.
> > > when suspended between two memory loads?
> >
> > You can do it seqlock-style, kind of - you reserve the first byte of
> > the page or so as a "is this page initialized" marker, and after every
> > read from the page, you do a compiler barrier and check whether that
> > byte has been
>
> That would also need smp cpu barriers, and guarantee that first byte
> is always ... cleared first, and matching barriers in kernel space,
> too, no?

Not if it happens in the guts of the suspend stuff, when userspace is
frozen, I think?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
