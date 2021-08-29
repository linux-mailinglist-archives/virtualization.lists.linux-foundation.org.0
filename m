Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B158B3FADA5
	for <lists.virtualization@lfdr.de>; Sun, 29 Aug 2021 20:11:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A8FE60604;
	Sun, 29 Aug 2021 18:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3chFpO5bP2jb; Sun, 29 Aug 2021 18:11:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E07D960649;
	Sun, 29 Aug 2021 18:11:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A07FC000E;
	Sun, 29 Aug 2021 18:11:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C269C000E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Aug 2021 18:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 587A3606BE
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Aug 2021 18:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sS2f7Fo2sQ5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Aug 2021 18:11:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FEB460604
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Aug 2021 18:11:35 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id c12so21794978ljr.5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Aug 2021 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nOEXbomGVxdTg2YIKOufPA0FWw0BA6Ntj3OHAW88ff4=;
 b=G9weGkeHN8FlJqJ0GQMGRkvYxT9+fXAmH0dB17bI65t7LV9Q70hlMMFtwZr4o4zSms
 C3ZBm+mpNRjS+UkmvFIj8dKgUWkyzIyP3SJa7hZUeOvoF9uuwyCa0eKl5/wXl5LDkYvt
 g1hC/0+a5me3A0DEW79RnUqRw17xLL0C1Ysgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nOEXbomGVxdTg2YIKOufPA0FWw0BA6Ntj3OHAW88ff4=;
 b=fMY2Z4FzeyxUuYECyOrzFmSOIC5SfXUW1JHTKcGoafsiiL7fhlRtdPrDT4zA1bcOvk
 fT+OMfqHLgGaitGBTB3ejBwprR52obQ/UG9xCUinXQR+4oImz79MmB+OwYtDwRuZqpKu
 CQ7su1oqHpf5hT7Q6UHqFXfxC32m+K112QV+B/MWL57d97uoeVYHJLogum35EtpSX/pH
 kVAFKQWl9/rVX5DLVVDEecfoQMT/ZkfVsNd9BBucflclUmEXUQOWdvAagY6vwzzwLlol
 OVsKkZfY3wR0wi6J040m2lsrVTvof9vmo87SaX1t2264MKfSIM4RDNjzCFg4R8EEtqaz
 J2Vg==
X-Gm-Message-State: AOAM530h+1nMOAeHkUXf8xC5EBCWarWRYtiXyidicABg5zlYSxsRcJaF
 mC5FYS5sOmbyhW1LCttGbVA+qpOxNNHm/Nx184A=
X-Google-Smtp-Source: ABdhPJwtuLSj5pBqfvRkbvofir5mBKQmfOQb1y9oCafmzra/QN41xYtRUJR5He5COhTOjpx8vC/Pog==
X-Received: by 2002:a05:651c:170b:: with SMTP id
 be11mr16769754ljb.219.1630260692780; 
 Sun, 29 Aug 2021 11:11:32 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id q7sm1536594ljg.137.2021.08.29.11.11.31
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 11:11:31 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id c12so21794891ljr.5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Aug 2021 11:11:31 -0700 (PDT)
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr17065408ljc.251.1630260691346; 
 Sun, 29 Aug 2021 11:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210829115343-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210829115343-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Aug 2021 11:11:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjYkPWoQWZEHXzd3azugRO4MCCEx9dBYKkVJLrk+1gsMg@mail.gmail.com>
Message-ID: <CAHk-=wjYkPWoQWZEHXzd3azugRO4MCCEx9dBYKkVJLrk+1gsMg@mail.gmail.com>
Subject: Re: [GIT PULL] virtio: a last minute fix
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: KVM list <kvm@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On Sun, Aug 29, 2021 at 8:53 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Donnu if it's too late - was on vacation and this only arrived
> Wednesday. Seems to be necessary to avoid introducing a regression
> in virtio-mem.

Heh. Not too late for 5.14, but too late in the sense that I had
picked this one up manually already as commit 425bec0032f5
("virtio-mem: fix sleeping in RCU read side section in
virtio_mem_online_page_cb()").

                Linus
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
