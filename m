Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE421678F
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 09:38:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 574D3279E9;
	Tue,  7 Jul 2020 07:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYcdsSPR6-X8; Tue,  7 Jul 2020 07:38:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4DE7E27663;
	Tue,  7 Jul 2020 07:38:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16239C016F;
	Tue,  7 Jul 2020 07:38:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6133AC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 48A4A88B2E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wO-QDpf6EMC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 554AC88A3E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:38:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f18so45417526wml.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jul 2020 00:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ikBOfPiAYjEtvfpg2ndBX1AEFGTwRae8CH9t1jZQyN4=;
 b=tIu4w0f6ESvyWDbyOXaHr/AXathWk5TAJ/DT+UGp8+bzOBwElcC6RXVWy7Wn3TFvT0
 E/RikQ0tjhedxZyqKpdO2GzbX9EpMV0/mO6g6cwQVOyi+F+NMEbGzQ9E4qf1zdKJUw9x
 YMkiUvYbkHXng3lSTlWOLCpULFuLr8Db5h37Pkn5llg0PW+We55ZBsW2S8tXOJ+KMAsI
 CUSxha85fE9ORlMXonqgPIdiD7fyWD5fgVFcZUNT+wvxHDRsjuEOhsE8R4cFkbwqzdLP
 WAEaykBDvNYVoehCSEQ0eJLbnyrcMfKVibZOePl6H2HJd68Q6FiFz2oTJG4JoB9zv5uP
 1lzw==
X-Gm-Message-State: AOAM533TnAWlHIPdLfsdfmv2NDRer+Iaq6eV8X92nwveet7OOk5G8A2J
 hXJwp7N8Gghk9gd/QZ+guxM=
X-Google-Smtp-Source: ABdhPJw+rfkXNBOmAmzmsHQwYBliQFLIQ5OnnLWSGUd52iK1yN+tLiulM3nr1g/sS85KQZxjR0w1Lg==
X-Received: by 2002:a1c:408b:: with SMTP id n133mr2750285wma.88.1594107505827; 
 Tue, 07 Jul 2020 00:38:25 -0700 (PDT)
Received: from localhost (ip-37-188-179-51.eurotel.cz. [37.188.179.51])
 by smtp.gmail.com with ESMTPSA id 33sm28857100wri.16.2020.07.07.00.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 00:38:24 -0700 (PDT)
Date: Tue, 7 Jul 2020 09:38:23 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jann Horn <jannh@google.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200707073823.GA3820@dhcp22.suse.cz>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
 <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG48ez2O2z4L=n57Omwy6s1sWQkdTkPKiikhbfdVhiyd_TGRRw@mail.gmail.com>
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

On Fri 03-07-20 15:29:22, Jann Horn wrote:
> On Fri, Jul 3, 2020 at 1:30 PM Michal Hocko <mhocko@kernel.org> wrote:
> > On Fri 03-07-20 10:34:09, Catangiu, Adrian Costin wrote:
> > > This patch adds logic to the kernel power code to zero out contents of
> > > all MADV_WIPEONSUSPEND VMAs present in the system during its transition
> > > to any suspend state equal or greater/deeper than Suspend-to-memory,
> > > known as S3.
> >
> > How does the application learn that its memory got wiped? S2disk is an
> > async operation and it can happen at any time during the task execution.
> > So how does the application work to prevent from corrupted state - e.g.
> > when suspended between two memory loads?
> 
> You can do it seqlock-style, kind of - you reserve the first byte of
> the page or so as a "is this page initialized" marker, and after every
> read from the page, you do a compiler barrier and check whether that
> byte has been cleared.

This is certainly possible yet wery awkwar interface to use IMHO.
MADV_EXTERNALY_VOLATILE would express the actual semantic much better.
I might not still understand the expected usecase but if the target
application has to be changed anyway then why not simply use a
transparent and proper signaling mechanism like poll on a fd. That would
be certainly a more natural and less error prone programming interface.

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
