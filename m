Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A302168D9
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 11:14:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8146787C49;
	Tue,  7 Jul 2020 09:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDhJhtf7B5bo; Tue,  7 Jul 2020 09:14:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A688B87C37;
	Tue,  7 Jul 2020 09:14:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92CABC08A5;
	Tue,  7 Jul 2020 09:14:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2570C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 09:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE4DF87C37
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 09:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSu-sct96XRC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 09:14:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AD1E785C10
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 09:14:55 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id q5so44322876wru.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jul 2020 02:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d1fV6kPM36TD326Nzxg7Z+ipDhi5SrBR72LA2cwak+8=;
 b=betEumm87jH194yeV+hxv1sh768AQDh0chjEf9MCoke/bTT2PrV1VPZrbrqXGBA57p
 ZCWr1qO6PHS6iQITwLo87HfX56U7+Ezq9X5+dV7YadWqYS5imv994HBcYNDti9QmSYMC
 As32X+ELG58gGu8S0x8PGKtaFtki1DBHX6CFctkKLVAl1XxsM5a2Ibkg6d+T/EBHMU1V
 y2MI67pyUPsKs/X33FDE8DmT9a8WHr+TtHvv/RyfNuoLyiTpK5YFUbrM3lhsBFDhsnkZ
 S/IikoEqGolGQe1h5gBhM5Zaw4zBDPLjTPydqzfEknFFIAbioCCAfszOVTu8yr/PXXsv
 fQSw==
X-Gm-Message-State: AOAM530tGCJzry5KHWW0lFk8yU6GyDJKzatIrtTr+AFZccf2yDHoXnky
 pYsASSmAhKFCmo1x4JVOCs4=
X-Google-Smtp-Source: ABdhPJzFu/LXDAQqw0UoyFr80RTenCH282ojT9C7p2oH1LQMP7cch/sujIzsdADrs5lAs/XWoztr4g==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr23258665wrt.24.1594113294131; 
 Tue, 07 Jul 2020 02:14:54 -0700 (PDT)
Received: from localhost (ip-37-188-179-51.eurotel.cz. [37.188.179.51])
 by smtp.gmail.com with ESMTPSA id w13sm111649wrr.67.2020.07.07.02.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 02:14:53 -0700 (PDT)
Date: Tue, 7 Jul 2020 11:14:51 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200707091451.GB5913@dhcp22.suse.cz>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703224411.GC25072@amd>
 <CAG48ez0oWQd42a-H-Dzw1Wq7HgB5PpFRGCZeYxP8ohxaoZHmvQ@mail.gmail.com>
 <20200704114820.GA16083@amd>
 <57ab4fb3-3f82-d34f-ad74-2214b45a4dd9@amazon.com>
 <CAG48ez1tAAD+x6n07uCisXpqVpDUPX7xBWiKFkS3u2azHqd41A@mail.gmail.com>
 <20200707074425.GC3820@dhcp22.suse.cz>
 <efa55313-ce8a-bac9-15df-167f93c672b3@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efa55313-ce8a-bac9-15df-167f93c672b3@amazon.com>
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Pavel Machek <pavel@ucw.cz>,
 "mingo@kernel.org" <mingo@kernel.org>, Jann Horn <jannh@google.com>, "Brooker,
 Marc" <mbrooker@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue 07-07-20 10:01:23, Alexander Graf wrote:
> On 07.07.20 09:44, Michal Hocko wrote:
> > On Mon 06-07-20 14:52:07, Jann Horn wrote:
> > > On Mon, Jul 6, 2020 at 2:27 PM Alexander Graf <graf@amazon.com> wrote:
> > > > Unless we create a vsyscall that returns both the PID as well as the
> > > > epoch and thus handles fork *and* suspend. I need to think about this a
> > > > bit more :).
> > > 
> > > You can't reliably detect forking by checking the PID if it is
> > > possible for multiple forks to be chained before the reuse check runs:
> > > 
> > >   - pid 1000 remembers its PID
> > >   - pid 1000 forks, creating child pid 1001
> > >   - pid 1000 exits and is waited on by init
> > >   - the pid allocator wraps around
> > >   - pid 1001 forks, creating child pid 1000
> > >   - child with pid 1000 tries to check for forking, determines that its
> > > PID is 1000, and concludes that it is still the original process
> > 
> > I must be really missing something here because I really fail to see why
> > there has to be something new even invented. Sure, checking for pid is
> > certainly a suboptimal solution because pids are terrible tokens to work
> > with. We do have a concept of file descriptors which a much better and
> > supports signaling. There is a clear source of the signal IIUC
> > (migration) and there are consumers to act upon that (e.g. crypto
> > backends). So what does really prevent to use a standard signal delivery
> > over fd for this usecase?
> 
> I wasn't part of the discussions on why things like WIPEONFORK were invented
> instead of just using signalling mechanisms, but the main reason I can think
> of are libraries.

Well, I would argue that WIPEONFORK is conceptually different. It is
one time initialization mechanism with a very clear life time semantic.
So any programming model is really as easy as, the initial state is
always 0 for a new task without any surprises later on because you own
the memory (essentially an extension to initialized .data section on
exec to any new task).

Compare that to a completely async nature of this interface. Any read
would essentially have to be properly synchronized with the external
event otherwise the state could have been corrupted. Such a consistency
model is really cumbersome to work with.

> As a library, you are under no control of the main loop usually, which means
> you just don't have a way to poll for an fd. As a library author, I would
> usually try to avoid very hard to create such a dependency, because it makes
> it really hard to glue pieces together.
> 
> The same applies to signals btw, which would also be a possible way to
> propagate such events.

Just to clarify I didn't really mean posix signals here. Those would be
quite clumsy indeed. But I can imagine that a library registers to a
system wide means to get a notification. There are many examples for
that, including a lot of usage inside libraries. All different *bus
interfaces.

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
