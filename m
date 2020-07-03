Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA0F213956
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 13:30:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DE349204CD;
	Fri,  3 Jul 2020 11:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9zpVRmLyybW; Fri,  3 Jul 2020 11:30:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6632F204C0;
	Fri,  3 Jul 2020 11:30:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 336B9C0733;
	Fri,  3 Jul 2020 11:30:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B36BEC0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 11:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9964E204C0
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 11:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPwuHLVuGZN2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 11:30:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by silver.osuosl.org (Postfix) with ESMTPS id BD5BE204B3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 11:30:29 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id d15so27412080edm.10
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 04:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t6wJkMnW5nIgCGC6amjGaAv58QMzf2CtwMzccOFo60Q=;
 b=MrdB3/e7Iyz44JudFVDXo1U+c9RV0bAplhMV7o1kgmO2DJ34H5K5laFNic/aNVnip1
 4KYE2TRaVyWj3q0D+2BbyizBCodOLROI+WEqty6FDLMzbU6a0coL2AC1+QhfjjvG5uMO
 rfLCOxKzjvv/vkCm8EgqE3l5yrD08QSOrULzqUH3h9n+SJ0DrJydszD18SXm0vlnpmWf
 rYiMoSro7x3fUw5vEwKiRnzm/8J8lzbQi03qD6fEwn7YDK0Nb66WJZByAvUeVLxlKT/W
 BaU0VXigMV9boi4u3nMsZ8XWsu9A//Czfn3slVEh87ubfT94mim4m5Axn/ecPzpmAB+y
 RYEg==
X-Gm-Message-State: AOAM533WnS2k37TewDOWUo9D6mhAzj+9x2Fap32ASCCiVgn4Ug59/+Uv
 GzsuTEAZWDqhqCAR2tI6Tuw=
X-Google-Smtp-Source: ABdhPJy019JabBFEmKZGz1Cc9GAUt3rvJgtYoQhP4TF0Qd+VrMWkh+pYbS4BdGiSV0sxR5zA36zkqw==
X-Received: by 2002:aa7:db11:: with SMTP id t17mr38671552eds.365.1593775828311; 
 Fri, 03 Jul 2020 04:30:28 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
 by smtp.gmail.com with ESMTPSA id v19sm14454298eda.70.2020.07.03.04.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 04:30:27 -0700 (PDT)
Date: Fri, 3 Jul 2020 13:30:26 +0200
From: Michal Hocko <mhocko@kernel.org>
To: "Catangiu, Adrian Costin" <acatan@amazon.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200703113026.GT18446@dhcp22.suse.cz>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "bonzini@gnu.org" <bonzini@gnu.org>, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, "wad@chromium.org" <wad@chromium.org>,
 "keescook@chromium.org" <keescook@chromium.org>, "MacCarthaigh,
 Colm" <colmmacc@amazon.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "Brooker,
 Marc" <mbrooker@amazon.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Weiss, Radu" <raduweis@amazon.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "Sandu, Andrei" <sandreim@amazon.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "luto@amacapital.net" <luto@amacapital.net>, "Singh,
 Balbir" <sblbir@amazon.com>, "mingo@kernel.org" <mingo@kernel.org>, "Manwaring,
 Derek" <derekmn@amazon.com>
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

On Fri 03-07-20 10:34:09, Catangiu, Adrian Costin wrote:
> This patch adds logic to the kernel power code to zero out contents of
> all MADV_WIPEONSUSPEND VMAs present in the system during its transition
> to any suspend state equal or greater/deeper than Suspend-to-memory,
> known as S3.

How does the application learn that its memory got wiped? S2disk is an
async operation and it can happen at any time during the task execution.
So how does the application work to prevent from corrupted state - e.g.
when suspended between two memory loads?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
