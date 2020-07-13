Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC8521D12D
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 10:02:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3576187FC1;
	Mon, 13 Jul 2020 08:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhTokC1xEYwm; Mon, 13 Jul 2020 08:02:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E33E889FC;
	Mon, 13 Jul 2020 08:02:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B2E4C0733;
	Mon, 13 Jul 2020 08:02:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 860BDC0888
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6CFE089450
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7On6CaP2HTYR
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:02:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 429E989431
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:02:10 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id d16so12240371edz.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 01:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QIHoei67Z3/KR3sFEx7o/EA6f6Nm5nK1Sv4SUBIKxAE=;
 b=K9Zmu/IGBeN+JmGpxj6vDsV91UaSXOnDBTUw2sQv7oAYZbMoTv5t3rwg3rH067U8NL
 9bt2ch/xA3aGeWxI48Xg3TZrYZQSXONofNKKHCb0QyNsz4adSDNDUCf+qcepzYcB9okq
 Zl++Pc7HHBnDTpFr+7KRQZm45K+ONrTqsWUJahz+O1Jq4ZH9RS619bQpp2+I4AOWLyje
 zLgtxLhpMqOAs1wRw1CLbTgsnxUSQkwwf0nRvMBYUs9T+k6UeTp8Qgw6xvDtSfkh8mxj
 moGEFNN9WrL8DMD92leLLXbHiGCWl38FcyR9a7bT70BYNFKB3QkRdEXzUoFI58K6ITAh
 SmVQ==
X-Gm-Message-State: AOAM530ewz1F9x5kZDPf1UL2WRdUjtMf/orO2HoKzETlB6EJrEEf0EsR
 JTjz5Pkt3fen5bwMg+9ZGfY=
X-Google-Smtp-Source: ABdhPJwWvN1QcpCsa31iIwBgYb5oydvR6pwx8KYoNceT/279HJ9gdKt0l1YifwXe/09Udr1Sulcp2A==
X-Received: by 2002:a05:6402:1c07:: with SMTP id
 ck7mr78270857edb.297.1594627328559; 
 Mon, 13 Jul 2020 01:02:08 -0700 (PDT)
Received: from localhost (ip-37-188-148-171.eurotel.cz. [37.188.148.171])
 by smtp.gmail.com with ESMTPSA id cw19sm9155356ejb.39.2020.07.13.01.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 01:02:07 -0700 (PDT)
Date: Mon, 13 Jul 2020 10:02:06 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200713080206.GD16783@dhcp22.suse.cz>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
 <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
 <20200707073823.GA3820@dhcp22.suse.cz> <20200707080726.GA32357@amd>
 <20200707085847.GA5913@dhcp22.suse.cz> <20200707163758.GA1947@amd>
 <E6B41570-E206-4458-921B-465B9EF74949@amazon.com>
 <20200712072228.GB4721@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200712072228.GB4721@duo.ucw.cz>
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 mingo@kernel.org, Jann Horn <jannh@google.com>, "Brooker,
 Marc" <mbrooker@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 len.brown@intel.com, bonzini@gnu.org, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, keescook@chromium.org, linux-pm@vger.kernel.org,
 "Catangiu, Adrian Costin" <acatan@amazon.com>,
 Colm MacCarthaigh <colmmacc@amazon.com>, fweimer@redhat.com, wad@chromium.org,
 linux-api@vger.kernel.org, "Manwaring, Derek" <derekmn@amazon.com>,
 rjw@rjwysocki.net, luto@amacapital.net, "Sandu, Andrei" <sandreim@amazon.com>,
 akpm@linux-foundation.org
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

On Sun 12-07-20 09:22:28, Pavel Machek wrote:
> On Tue 2020-07-07 12:00:41, Colm MacCarthaigh wrote:
> > 
> > 
> > On 7 Jul 2020, at 9:37, Pavel Machek wrote:
> > > Please go through the thread and try to understand it.
> > > 
> > > You'd need syscalls per get_randomness(), not per migration.
> > 
> > I think one check per get_randomness() is sufficient, though putting it at
> > the end of the critical section rather than the beginning helps.
> 
> Yeah, well, one syscall is still enough to make it useless.

I am sorry but I really do not follow. Why would you want to call a
syscall on each get_randomness invocation? Why is it not enough to
simply have a flag that tells that an external event has happened
and reinitialize if the flag is set? Yes this wouldn't be really sync
operation but does that matter? Is using a few random numbers from the
old pool just because the notifier hasn't processed and flag the
situation a major security concern?

Btw. let me just clarify that I am not by any means pushing a solution
like that. All I am saying is that MADV_WIPEONSUSPEND is inherently
subtle interface that we likely want to avoid.
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
