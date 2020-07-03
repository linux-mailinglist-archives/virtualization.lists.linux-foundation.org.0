Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D745213B00
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 15:29:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D94B2204C0;
	Fri,  3 Jul 2020 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XW2mZfhjSEno; Fri,  3 Jul 2020 13:29:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8086C2045C;
	Fri,  3 Jul 2020 13:29:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53335C0733;
	Fri,  3 Jul 2020 13:29:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C834C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 13:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 68D138957C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 13:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J+Jx+nx-4j-p
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 13:29:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3C48588CCE
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 13:29:51 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f5so21103369ljj.10
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X6zEQxvzQothZO05B4Wll0a1I7lNr/ukJgbFHD247Sw=;
 b=Q+uRhAVOIHXP3l5DGk1/AYscHvETYA8Ymm5mRBlR/XZ2o2UW9mnCLU7VESU4lL2OEy
 eZ7C26WENmNIB+gotFApffDk/Lm7wJJqW5WXxjtTJj6ZiS4cgcRVF/lud+lYD1VwE1xf
 cpzjiyELopP+C254O+Z8QVDXT6TXntwWbSEvwdpuLJb4iJGFg0nif+DbsqwcsfIyngvR
 cwwjXDlL0psFU3T01tJoAkowFEsXFjdqFGfsuc6+LYN6r4gQLlzEBZ55aY5+vXoDAqAM
 Cowz37opXoR4SPkIBRF8f/Wk2fYINKRcK4N7PEfRIqRnbLoh53R1SadZbb95BsxIbR06
 8FKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X6zEQxvzQothZO05B4Wll0a1I7lNr/ukJgbFHD247Sw=;
 b=uGPAyrsgz67wIx5Bcq5vGKfxhBHHe/T+1B78TbzvzJxOctwTAvZBZHj+s8Dkr4ugmD
 aLBG0cpUl0r6TLWRHCkcjVCm15UVwQd2/5siD52C9urSGnq4Ozffy3LownG4chuQIabI
 zw/IXwtpHISQioIdEqZsMaudZIjae37r8Syt39YVUmuDvXvuU/aMahNMojrUEiSIqZkk
 bG8n0o/okNWW3eyJFqAmanzWEnqugqu+6d0UB3B+zz1GCrOqVji53KaCZW+LHj8ag0sI
 fMGd4fuLM1qKVnJahnh69q6YwuIHGJmyx+wjNZOLMear1N4FIONnXrZurXoSxdfeZkIs
 YBZg==
X-Gm-Message-State: AOAM5303XvAiajTAyrnDsXyfIPNLt8VYSxeEYQ3IoSaa5jgWZonAwp8m
 9scP92oJ/xEpX8z2a1f46BAZaO3SbgJpici7ZIeUqQ==
X-Google-Smtp-Source: ABdhPJyEDqX5CTF1WB5GWdO0bVAwepG+Vq+Mz8st/b4+OZW1Wmil9vt0PgmzZxcYnwapEuHceWJOgE/vqRlZbxTSVp8=
X-Received: by 2002:a2e:9dcc:: with SMTP id x12mr3182797ljj.415.1593782989137; 
 Fri, 03 Jul 2020 06:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
In-Reply-To: <20200703113026.GT18446@dhcp22.suse.cz>
Date: Fri, 3 Jul 2020 15:29:22 +0200
Message-ID: <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
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
From: Jann Horn via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Jul 3, 2020 at 1:30 PM Michal Hocko <mhocko@kernel.org> wrote:
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

You can do it seqlock-style, kind of - you reserve the first byte of
the page or so as a "is this page initialized" marker, and after every
read from the page, you do a compiler barrier and check whether that
byte has been cleared.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
