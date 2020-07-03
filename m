Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C192141DD
	for <lists.virtualization@lfdr.de>; Sat,  4 Jul 2020 00:56:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5AFE526633;
	Fri,  3 Jul 2020 22:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4FDTmtTss54; Fri,  3 Jul 2020 22:56:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4DFC6265F6;
	Fri,  3 Jul 2020 22:56:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C0CAC0733;
	Fri,  3 Jul 2020 22:56:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A38BC0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 15E9A88BC7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbEF6Rc6fZt8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:56:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1976A88A93
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 22:56:31 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u25so19380343lfm.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HbgA4RzqidtZFEVtt5akl8++MP32OZjgKqPdlkBDgXs=;
 b=UeZlVA56DqwTv9Lh1HYTByyGxaiUrgbCpUb5wwS/W3ttQUa/nvZj+SlwPS35p4CYSP
 Dowgopsc43EYqpsAdDrA2Xpid3lkfppKMVYaEQf/e8bD3MGnuO2VKhSicJ5UMowB4JIv
 1EGmWrpPbBWxHHAF74B0p12xAwXZ89dk7RJo6xAoFLJ0ejv4EI2nlhY1B50UjO1cPtJ7
 nKtGAslCAzgcf2mxWINZ5sK/mtNkc7OeZe8Lkwg/U5dpuvCWk8FDTjU70/wcDwVNA6o0
 gSdzbay7w2WFaxVj7xbHwB0IyEehWpmOReepW9FeS88uEUObxDYUB7E8A0YxAmd/b9tG
 M72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HbgA4RzqidtZFEVtt5akl8++MP32OZjgKqPdlkBDgXs=;
 b=PqEWjEFAx6+9KvQq+X6LbeESni4011aEMi2I4D7lzpY+Jnu8MHIwGxbj4CjkZgcQuB
 fFWzCgFGFpioKZtmxQROkmadH/tYzkx9/GKzM4LH227+g4Nz9T+vMg/UwhYSABWBZuRd
 O7rBbqTf1EbI+k78Xj4PSNjrq+PXlmjHgz6hLy7MzIlgoNTzkkWNopP/XDumRA2RQ8sz
 +9DmLxOBhoql8EABiN5brCEllMNeJCEj7LBtNyXtId1GX2rx5Ntseb/HY2q2kGj9Hm8p
 89iemNquP6qTRWDn12xxqnmtKAtczWdXKGtkgBdvz7dFbmD35Hdk1anVXkALiCtN0FO3
 DZXA==
X-Gm-Message-State: AOAM531Oh8wYhhs0Qgl7EkKJZKovNSXxkjjK+ChDLgtD6XrokN9Vx9GJ
 VX9dDTZvirYDhBj4c2sv00c8Io8TH1bCEYY37xsirg==
X-Google-Smtp-Source: ABdhPJwMLT+gN9QjK+IvxYNcKqOXF1CgkwQpOJdeVbidIY1M/NzUS4Gb23Gqi9y7RTbtdUpFyLm5YuABMHLAclQ1HnM=
X-Received: by 2002:a05:6512:752:: with SMTP id
 c18mr888011lfs.141.1593816989653; 
 Fri, 03 Jul 2020 15:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703224411.GC25072@amd>
In-Reply-To: <20200703224411.GC25072@amd>
Date: Sat, 4 Jul 2020 00:56:03 +0200
Message-ID: <CAG48ez0oWQd42a-H-Dzw1Wq7HgB5PpFRGCZeYxP8ohxaoZHmvQ@mail.gmail.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
To: Pavel Machek <pavel@ucw.cz>
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "mingo@kernel.org" <mingo@kernel.org>, "mhocko@kernel.org" <mhocko@kernel.org>,
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

On Sat, Jul 4, 2020 at 12:44 AM Pavel Machek <pavel@ucw.cz> wrote:
> > Cryptographic libraries carry pseudo random number generators to
> > quickly provide randomness when needed. If such a random pool gets
> > cloned, secrets may get revealed, as the same random number may get
> > used multiple times. For fork, this was fixed using the WIPEONFORK
> > madvise flag [1].
>
> > Unfortunately, the same problem surfaces when a virtual machine gets
> > cloned. The existing flag does not help there. This patch introduces a
> > new flag to automatically clear memory contents on VM suspend/resume,
> > which will allow random number generators to reseed when virtual
> > machines get cloned.
>
> Umm. If this is real problem, should kernel provide such rng in the
> vsdo page using vsyscalls? Kernel can have special interface to its
> vsyscalls, but we may not want to offer this functionality to rest of
> userland...

And then the kernel would just need to maintain a sequence
number in the vDSO data page that gets bumped on suspend, right?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
