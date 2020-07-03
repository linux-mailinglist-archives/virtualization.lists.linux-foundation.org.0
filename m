Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E22139E2
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 14:18:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E42D88DF7;
	Fri,  3 Jul 2020 12:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwqDU4Gbf6-x; Fri,  3 Jul 2020 12:18:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77A5F88E07;
	Fri,  3 Jul 2020 12:18:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 541A9C0733;
	Fri,  3 Jul 2020 12:18:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 378D8C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 12:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 26206898E3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 12:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VX+UPBrbXtjI
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 12:18:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 964B588C05
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 12:18:02 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l63so24921468oih.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 05:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oi7KCmisZZOxbTNZth57zE50NPkwGb8qPSfZLePIfnw=;
 b=BAU71y3skJ1gswEj/TKK/m3AH/r+09kU5DkIVe40sqZ1rRoq68liOayDQHnu2a2YTq
 vxAuF9OjGakZTE01aubDx8VH74NR2cP8t5i6ETq2f3S4hG1Nm7QckqIVIJpcEpz7yg40
 rQ81SmSug2AbWomd8YOU+0czbuaKkS1YKhpTGvR+3ORuWe4fxGI3xMfWpgr8JR77mIy8
 Nvv09OUy/BggkcBUqVgzTMqnZqyfb9B+RrXeIp6wbxy46rIAUnHWtlghoGMSwptIMazR
 ZBawx0/ohHkDrC/onR7fhMdGha4Be/ydk+nk+oLaZ3ZAmA/jaG+fWPT2Y3WJP+3gzrkV
 8qiQ==
X-Gm-Message-State: AOAM532p2f4rfzCgP4TGnTJ2sYT1jtVSC8PnoPhsyU5zt5hBGLX+F/XO
 3H/WmOHM2Odh9Je3MI+s5FcGNcTYMTK0HHtLsYw=
X-Google-Smtp-Source: ABdhPJxm1iEh0OWPmzqlUOmdOGmVD+UuYAFKeFz4ataM8y7DQH47+7k+7QSzTHoKyaeMab0wApcKrHwBwSbc13PGcPk=
X-Received: by 2002:aca:e188:: with SMTP id y130mr9572140oig.110.1593778681863; 
 Fri, 03 Jul 2020 05:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
In-Reply-To: <20200703113026.GT18446@dhcp22.suse.cz>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 3 Jul 2020 14:17:50 +0200
Message-ID: <CAJZ5v0g+ip-EuUsoK646W-jVSSUhbnvHKsWmFH0+F1w0oYSmGw@mail.gmail.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
To: Michal Hocko <mhocko@kernel.org>
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "mingo@kernel.org" <mingo@kernel.org>, "Brooker, Marc" <mbrooker@amazon.com>,
 "Singh, Balbir" <sblbir@amazon.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Jul 3, 2020 at 1:30 PM Michal Hocko <mhocko@kernel.org> wrote:
>
> On Fri 03-07-20 10:34:09, Catangiu, Adrian Costin wrote:
> > This patch adds logic to the kernel power code to zero out contents of
> > all MADV_WIPEONSUSPEND VMAs present in the system during its transition
> > to any suspend state equal or greater/deeper than Suspend-to-memory,
> > known as S3.
>
> How does the application learn that its memory got wiped? S2disk is an
> async operation and it can happen at any time during the task execution.
> So how does the application work to prevent from corrupted state - e.g.
> when suspended between two memory loads?

This doesn't affect hibernation AFAICS, but system suspend
(suspend-to-RAM or suspend-to-idle, or standby) is async too.

I guess this calls for an interface to notify user space (that opted
in to receive such notifications) on system-wide suspend start and
finish.

Thanks!
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
