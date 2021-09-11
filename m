Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FCC407A95
	for <lists.virtualization@lfdr.de>; Sun, 12 Sep 2021 00:00:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEFAB6080A;
	Sat, 11 Sep 2021 21:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nqgMSiX1x1c9; Sat, 11 Sep 2021 21:56:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8275A60B4D;
	Sat, 11 Sep 2021 21:56:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F37DC0022;
	Sat, 11 Sep 2021 21:56:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A916DC000D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Sep 2021 21:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B53C826C1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Sep 2021 21:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux-foundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQRo_BqDoBcU
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Sep 2021 21:56:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2427826C0
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Sep 2021 21:56:31 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id l11so12089778lfe.1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Sep 2021 14:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fVJ++gcLyqeb6D8u1bo0Qp2kTZx0cgjBEYii9V19c2g=;
 b=LLoNF6oh8l3EZwSYDeoHHad+NI8KQodeBADF5xTQPYQy8DfffT6/oL+SAksiZVHb5+
 q7GML4URU9mehf3zntJZ23AkN/TV1AUFum60PC0RF5KNdJx2mQE4YKpZQ0ayOhWHPfKB
 xNonKr7pi7T7RpKSX5hWNYhSSkD/lXVv/43vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fVJ++gcLyqeb6D8u1bo0Qp2kTZx0cgjBEYii9V19c2g=;
 b=EkCJ/wR5ryfTTKjyD3TKWJq4uyZwMBvVfl2w1+og9mI/3P9YvPXFPgcG3CShFyo3LW
 glNsa3p5d3ZOFW8eSzJI9QhTxOk8RmjQo1kVdjehxUPMD7MhUEpku/hZcDvL5izpz0Lj
 3I9UqVgy5Tr3U76mCpNz47Z9tv5BdN58BiAG5KPSpuS5dkO0z6tE5k4CJLQF3fdM0K9Q
 oN3pTOI+/AlJJQxfLdgmuyZh5JB25l19dq7YxS7VaOKz5BAzCE3Ck0RDDwydeTUek2zS
 d6Ul6om8rK+BfgLQz0aiuIFBgYLetp1LC6x9BUD3HcjOGA4v/T/fvR8oWVbUzM9f7P08
 4kyg==
X-Gm-Message-State: AOAM5320NDkhZlTQXaCXJaK3PdMvru4Yd2cqbtbKheHJMhZiHdR7zeRx
 +e3x69NHASCTt59OcSzg76UeGSAtvzEdrrQ+o8o=
X-Google-Smtp-Source: ABdhPJzIYODMDX8O/9gORdwbsPgDwzrmXVbQeR8a3TYpvaf3iPQUaM/SbIbmBHSTbfet/ytLDIdBpQ==
X-Received: by 2002:ac2:5fa3:: with SMTP id s3mr3380623lfe.605.1631397389204; 
 Sat, 11 Sep 2021 14:56:29 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id x4sm330025ljm.98.2021.09.11.14.56.28
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 14:56:28 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id h16so12043840lfk.10
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Sep 2021 14:56:28 -0700 (PDT)
X-Received: by 2002:a05:6512:2611:: with SMTP id
 bt17mr3487995lfb.141.1631397388084; 
 Sat, 11 Sep 2021 14:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210909095608-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210909095608-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 11 Sep 2021 14:56:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgcXzshPVvVgGDqa9Y9Sde6RsUvj9jvx0htBqPuaTGX4Q@mail.gmail.com>
Message-ID: <CAHk-=wgcXzshPVvVgGDqa9Y9Sde6RsUvj9jvx0htBqPuaTGX4Q@mail.gmail.com>
Subject: Re: [GIT PULL] virtio,vdpa,vhost: features, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: mgurtovoy@nvidia.com, lingshan.zhu@intel.com,
 KVM list <kvm@vger.kernel.org>, xianting.tian@linux.alibaba.com,
 Netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Wolfram Sang <wsa@kernel.org>,
 xieyongji@bytedance.com, Viresh Kumar <viresh.kumar@linaro.org>,
 arseny.krasnov@kaspersky.com, Will Deacon <will@kernel.org>, elic@nvidia.com
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

On Thu, Sep 9, 2021 at 6:56 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> NB: when merging this with
> b542e383d8c0 ("eventfd: Make signal recursion protection a task bit")
> from Linus' tree, replace eventfd_signal_count with
> eventfd_signal_allowed, and drop the export of eventfd_wake_count from
> ("eventfd: Export eventfd_wake_count to modules").

What? No. That can't be right.

Do you mean "replace eventfd_signal_count with !eventfd_signal_allowed()"?

Because if I read the logic correctly, the issue is that
'vduse_vq_kick()' will call eventfd_signal().

Which it must not do it eventfd_signal_allowed() returns false.

So if eventfd_signal_allowed() is _not_ set, the code needs to defer
it to the workqueue.

No?

Side note: I was _this_ close to just not pulling this. The commits
were all from after the merge window opened, and I got this pull
request in the latter half of the second week of the merge window.

Your "explanations"  for this pull are also not any language I
recognize, or even remotely human-readable.

WTF does "vduse driver supporting blk" mean, and how is that supposed
to explain anything at all?

That is NOT how these things are supposed to work. AT ALL.

So you are hereby put on notice: next time I get this kind of
half-arsed garbage pull request, I won't spend the energy on trying to
figure out what is actually going on. I will just throw it in the
trash.

Because honestly, that's where this pull request belonged.

              Linus
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
