Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A5A2157A3
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 14:52:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6433C86ACA;
	Mon,  6 Jul 2020 12:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBr9maK0nXMO; Mon,  6 Jul 2020 12:52:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB3A386AAC;
	Mon,  6 Jul 2020 12:52:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D26E8C016F;
	Mon,  6 Jul 2020 12:52:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC9E6C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 12:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E881888A5F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 12:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtIG-h7RoaJG
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 12:52:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8532B88A5E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 12:52:35 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id z24so20283674ljn.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Jul 2020 05:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r/l418RqBKygT3XUaVVUWM37eZi8gQrBBNYXDXbn38k=;
 b=B1r3fG6dsH/qouMx2ubARUPAdcsyFNEgp1v1D8jfa52c8J7fRImq0ys4SnNlP6XrN2
 99Raf5nlxeqcQN1Tn47ilpKlji+mfh9L+e+Rup7zFPMbiIFcs8P2uqJ4ASVgCVZ66Hl3
 6/zGA4OKUhaVEjYmTMnmmU1m9r5vvu7tNcDRxLkBGD8VQXhgpGDcZzSvZFhoW7xr7Ugo
 seaC0JArz8AlAHcKsDf4KJxiCUXx/Jd+yuiCpMAl4YopCCdiTLEoUUy+wjdBQ17l/PUy
 FYI8QkWPGr6GT3rclGkWVFo64BXFXCZb4R0vyPT+BKs0jBiNdc13WXKOOvLxnvW2WDNJ
 xcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/l418RqBKygT3XUaVVUWM37eZi8gQrBBNYXDXbn38k=;
 b=DSjs/XV7X9zVpREOZuMvxRR87ijzU4wLXeT/I7Kk22U3BnXM0QdBwVWF3MkM+VRJE8
 cePaGWIbL8AHlk7pw/4yJ0L7SiXIJeY5MnbVoRrICXjk5P3+LuQG7uVAfxr68pD7Mo5s
 /pnTkjKwodxo9TCXoMcCtJdwpQ758oH8Y9T+i4sVNN6FCvg5OgcH0mEzxCRcSt3szZw/
 Ya3VHUfh6ky9cPtRSobpT3WL9Vo3wqdpyw/6GUdqI2r2bq5UdSSilKLMS/pUu4W9YGFp
 S876rHuahyHVViOeJFgC6G20KgXRUUv0ebBan1bM9rjcnVqUIf/nX6J6a+s1MoZlspDa
 scYw==
X-Gm-Message-State: AOAM531P3e0pjBjsISQuL9WBtZY1VvcrCV523hesHiDZCdils/wr2oc+
 DRLJ7UAvzB6mFg2j8fVpG9FfegZX7x11s5kS9oPG1Q==
X-Google-Smtp-Source: ABdhPJwjpTKLYWq+hR31eDYdmY+r8r9swuzWK5B3LmVV+w60tAqfgVu13/vDXFsFyS2tITflFJ5EFbHXt6vJDWkzwko=
X-Received: by 2002:a05:651c:3cf:: with SMTP id
 f15mr26115232ljp.365.1594039953375; 
 Mon, 06 Jul 2020 05:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703224411.GC25072@amd>
 <CAG48ez0oWQd42a-H-Dzw1Wq7HgB5PpFRGCZeYxP8ohxaoZHmvQ@mail.gmail.com>
 <20200704114820.GA16083@amd> <57ab4fb3-3f82-d34f-ad74-2214b45a4dd9@amazon.com>
In-Reply-To: <57ab4fb3-3f82-d34f-ad74-2214b45a4dd9@amazon.com>
Date: Mon, 6 Jul 2020 14:52:07 +0200
Message-ID: <CAG48ez1tAAD+x6n07uCisXpqVpDUPX7xBWiKFkS3u2azHqd41A@mail.gmail.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
To: Alexander Graf <graf@amazon.com>
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Pavel Machek <pavel@ucw.cz>,
 "mingo@kernel.org" <mingo@kernel.org>, "mhocko@kernel.org" <mhocko@kernel.org>,
 "Brooker, Marc" <mbrooker@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "bonzini@gnu.org" <bonzini@gnu.org>,
 "keescook@chromium.org" <keescook@chromium.org>,
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

On Mon, Jul 6, 2020 at 2:27 PM Alexander Graf <graf@amazon.com> wrote:
> Unless we create a vsyscall that returns both the PID as well as the
> epoch and thus handles fork *and* suspend. I need to think about this a
> bit more :).

You can't reliably detect forking by checking the PID if it is
possible for multiple forks to be chained before the reuse check runs:

 - pid 1000 remembers its PID
 - pid 1000 forks, creating child pid 1001
 - pid 1000 exits and is waited on by init
 - the pid allocator wraps around
 - pid 1001 forks, creating child pid 1000
 - child with pid 1000 tries to check for forking, determines that its
PID is 1000, and concludes that it is still the original process
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
