Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD3E2168AC
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 10:58:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 86BE28994B;
	Tue,  7 Jul 2020 08:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89tGVRMAZ-0P; Tue,  7 Jul 2020 08:58:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F56C89942;
	Tue,  7 Jul 2020 08:58:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65897C016F;
	Tue,  7 Jul 2020 08:58:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B3FCC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 08:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 30C5988F4B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 08:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Af+gfOfhp9Jq
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 08:58:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3A8B6878B0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 08:58:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b6so44277652wrs.11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jul 2020 01:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p2KKakvKcIBMPs7A15wXqiGUJod4izHac2NRC29BoeY=;
 b=qpm790kEyTwYs/BnuVbWbOehXNgTUI9ngXHQ9Gr9Xc2OmLhb8UM6Zi4iYgn8oKcOWs
 DUXvXMeUGQEKAtAGSr6JO68bgsYsWJqyp4Yzj3TC60oYCCO2VzQgPef/vtzpXbs1TugQ
 fHCLLnugJJpBGLp5AuAMqJtG1ycycsbW4KlcoFeP1OcbW2KL4ggy7bmH+yLk2aXTfiH5
 PfCA8861ZS9qEPp1FOgFFIg/UKi2BPKQLSKAZkNGbWkT7LVbMKJXKSl+A3j05QRz0/YJ
 NOOCAHi4nVmubhDu09GjspniM4pS1AmQez9j2VZ5iA8XZPc3PRssItNvf0gqp8G88sf8
 JU4w==
X-Gm-Message-State: AOAM532TF//BEFwm5ya4BF7FNCQKxfsLIy+z+97J1T74QL1lmuUHiZuG
 NkBz3k3pkUgfer/p0M39noI=
X-Google-Smtp-Source: ABdhPJwh9XUbUNDBRq8RVH5mZ3inft6fVxiv+AyB+oFzHzHwbX6vqWzzuu2czS9FjeuVL6nNGIn0OA==
X-Received: by 2002:adf:81c8:: with SMTP id 66mr52819103wra.348.1594112329520; 
 Tue, 07 Jul 2020 01:58:49 -0700 (PDT)
Received: from localhost (ip-37-188-179-51.eurotel.cz. [37.188.179.51])
 by smtp.gmail.com with ESMTPSA id v5sm192665wmh.12.2020.07.07.01.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 01:58:48 -0700 (PDT)
Date: Tue, 7 Jul 2020 10:58:47 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200707085847.GA5913@dhcp22.suse.cz>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
 <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
 <20200707073823.GA3820@dhcp22.suse.cz> <20200707080726.GA32357@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707080726.GA32357@amd>
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "mingo@kernel.org" <mingo@kernel.org>, Jann Horn <jannh@google.com>, "Brooker,
 Marc" <mbrooker@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
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

On Tue 07-07-20 10:07:26, Pavel Machek wrote:
> Hi!
> 
> > > > > This patch adds logic to the kernel power code to zero out contents of
> > > > > all MADV_WIPEONSUSPEND VMAs present in the system during its transition
> > > > > to any suspend state equal or greater/deeper than Suspend-to-memory,
> > > > > known as S3.
> > > >
> > > > How does the application learn that its memory got wiped? S2disk is an
> > > > async operation and it can happen at any time during the task execution.
> > > > So how does the application work to prevent from corrupted state - e.g.
> > > > when suspended between two memory loads?
> > > 
> > > You can do it seqlock-style, kind of - you reserve the first byte of
> > > the page or so as a "is this page initialized" marker, and after every
> > > read from the page, you do a compiler barrier and check whether that
> > > byte has been cleared.
> > 
> > This is certainly possible yet wery awkwar interface to use IMHO.
> > MADV_EXTERNALY_VOLATILE would express the actual semantic much better.
> > I might not still understand the expected usecase but if the target
> > application has to be changed anyway then why not simply use a
> > transparent and proper signaling mechanism like poll on a fd. That
> 
> The goal is to have cryprographically-safe get_random_number() with 0
> syscalls.
> 
> You'd need to do:
> 
>    if (!poll(did_i_migrate)) {
>          use_prng_seed();
> 	 if (poll(did_i_migrate)) {
> 	       /* oops_they_migrated_me_in_middle_of_computation,
>  	          lets_redo_it() */
>  		  goto retry:
> 	 }
>    }
> 
> Which means two syscalls..

Is this a real problem though? Do we have any actual numbers? E.g. how
often does the migration happen so that 2 syscalls would be visible in
actual workloads?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
