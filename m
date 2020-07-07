Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE22167A4
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 09:44:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F1D8C279EE;
	Tue,  7 Jul 2020 07:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rV6Uie5zeNse; Tue,  7 Jul 2020 07:44:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EFC03279D6;
	Tue,  7 Jul 2020 07:44:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C64C5C016F;
	Tue,  7 Jul 2020 07:44:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF0D8C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB2E1876C5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnz9GeHGhyyo
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:44:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D752E875A9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:44:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o8so42202173wmh.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jul 2020 00:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F4aqx7HxhCSSKHXwc2697sIHhQdT/BBdsfLF62DEQE4=;
 b=c3zP6fTeQtLyabIdnYSGxJJ1zSIzGkCPlUAl7zDd+L5t8d5dOmt/DbjfDeJDaXb5xN
 Bzq2bUv0+uwA05pY85RLypl5qqGD9UYvl0CftYoHJwyzPhcUm1IKcKZscZkp48Fm5HMN
 Mv6Anc2xGYE7Uxy/IfobPVUCbqTC8+5zg8E0552RKGp1stH9fAA8owfzcRQUmvkOqScm
 oHR0iKXrByKt5rt1Xmh6mNRIvWw6oKMlJCbaE8xdOLoUzrDRsnziBVzGMDQmONKzSkzj
 Wk0bN6/myuTZckBHHZhK/TRIlWWTKxuxyMvyCqRfIyqYifOWXyRTlO/tbkkQ5AAe60sW
 7Uog==
X-Gm-Message-State: AOAM531RToTuivcjUHOuansznWKUIGHFKjyhsuFSweDCtaOD2koy6nXH
 iVz4+faHPdKeeTNBi7x8zYs=
X-Google-Smtp-Source: ABdhPJx+I2TIfUFvZS7RzpHU0dX1TjZmj/O3FD7sf6peHipy/sldWFpAe42dJn2scLZ0GHRhPo4TxQ==
X-Received: by 2002:a7b:c197:: with SMTP id y23mr2950573wmi.114.1594107867373; 
 Tue, 07 Jul 2020 00:44:27 -0700 (PDT)
Received: from localhost (ip-37-188-179-51.eurotel.cz. [37.188.179.51])
 by smtp.gmail.com with ESMTPSA id q7sm15968740wra.56.2020.07.07.00.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 00:44:26 -0700 (PDT)
Date: Tue, 7 Jul 2020 09:44:25 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jann Horn <jannh@google.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200707074425.GC3820@dhcp22.suse.cz>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703224411.GC25072@amd>
 <CAG48ez0oWQd42a-H-Dzw1Wq7HgB5PpFRGCZeYxP8ohxaoZHmvQ@mail.gmail.com>
 <20200704114820.GA16083@amd>
 <57ab4fb3-3f82-d34f-ad74-2214b45a4dd9@amazon.com>
 <CAG48ez1tAAD+x6n07uCisXpqVpDUPX7xBWiKFkS3u2azHqd41A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG48ez1tAAD+x6n07uCisXpqVpDUPX7xBWiKFkS3u2azHqd41A@mail.gmail.com>
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Pavel Machek <pavel@ucw.cz>,
 "mingo@kernel.org" <mingo@kernel.org>, "Brooker, Marc" <mbrooker@amazon.com>,
 "Singh, Balbir" <sblbir@amazon.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "bonzini@gnu.org" <bonzini@gnu.org>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, Alexander Graf <graf@amazon.com>,
 "MacCarthaigh, Colm" <colmmacc@amazon.com>,
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

On Mon 06-07-20 14:52:07, Jann Horn wrote:
> On Mon, Jul 6, 2020 at 2:27 PM Alexander Graf <graf@amazon.com> wrote:
> > Unless we create a vsyscall that returns both the PID as well as the
> > epoch and thus handles fork *and* suspend. I need to think about this a
> > bit more :).
> 
> You can't reliably detect forking by checking the PID if it is
> possible for multiple forks to be chained before the reuse check runs:
> 
>  - pid 1000 remembers its PID
>  - pid 1000 forks, creating child pid 1001
>  - pid 1000 exits and is waited on by init
>  - the pid allocator wraps around
>  - pid 1001 forks, creating child pid 1000
>  - child with pid 1000 tries to check for forking, determines that its
> PID is 1000, and concludes that it is still the original process

I must be really missing something here because I really fail to see why
there has to be something new even invented. Sure, checking for pid is
certainly a suboptimal solution because pids are terrible tokens to work
with. We do have a concept of file descriptors which a much better and
supports signaling. There is a clear source of the signal IIUC
(migration) and there are consumers to act upon that (e.g. crypto
backends). So what does really prevent to use a standard signal delivery
over fd for this usecase?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
