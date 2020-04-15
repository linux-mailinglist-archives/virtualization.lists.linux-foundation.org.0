Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF21AB0C3
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 20:34:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D6D4087A3A;
	Wed, 15 Apr 2020 18:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GdRJ+LywJ5T; Wed, 15 Apr 2020 18:34:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 50FAF879F0;
	Wed, 15 Apr 2020 18:34:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 223A8C1D8D;
	Wed, 15 Apr 2020 18:34:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B84FC0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 18:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E6C6F87941
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 18:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcthVTVpu1AY
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 18:34:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5935C87934
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 18:34:02 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t4so2932970ilp.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 11:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9UMk7iODAFp6jJ2ap9TJX1Q390mTJtmNiuTIdqdGnQc=;
 b=QJnqo+EfdZOp6joNPh6a0FAjQhgNwqhDxdiExK6DYxj+y1q+Ah3N5AHRLOHsxSMV8k
 eh1Q/htMu6FQb36ixOJ8oWf3hZOVngpMETOjE9ZZFLemXPG2Hk1ycsKNbgPmLLUYK8NG
 L3fZ9I1UXJGt6BUsRaXgreqOfBsCLlYrftJTkZrrtNMh39PTlBtLuOrACrsyn86QMVmZ
 KZInpxQxXnB3Csk7TxgGTGrg/X+9HVgxZqPcn+Mlp5rkO+EZtvFex7r8Yz5m1rPEChHy
 d6+ZU8YLS1TRGvfByT6lQv75XtRwtcwMKtauhT9kDzevSc4i+uwtiroBC6cT5uQmmi7K
 6t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9UMk7iODAFp6jJ2ap9TJX1Q390mTJtmNiuTIdqdGnQc=;
 b=QmvUuC1Kc0pWu+ry247Caiks7nIPtZzFHaGCgVeKrn4Y+VYACyVHrIYPBS1koVOzPf
 8uZMRh+WBBGNF08iGtkrocJIUOVKdlM+OXnlPsuv0ZsgscaFSl9asA5+WJMH95rslEcb
 4doAv2sAWBDJ+Ad2/rMJz3f1b8W8carnbY8AEywi0YPsWUXkhIOQF/ZQzAcjFGyOXInw
 ycFhZ/rxeF8TIUuSnYpObA1hMTt2+M46tIUblHH/Hcrf1pTn0+zMhofz7X/4T8Lbwzj1
 k+mZcyaluOl79hDQ0BoB9qWd54DGxSbuIdTr4l0QAqYu1YEjS7jHiOyDXBm4fW4kiY0f
 q2hg==
X-Gm-Message-State: AGi0PubIXfheV5J3mtgcGxASTp6ZeSQxpbEn2ULty6hvxaBVa08vjAyP
 FEnVmDJbW2ZTrUIYPUnEhPFWjkb/LlLuZWPdb2Q=
X-Google-Smtp-Source: APiQypKHQpK/hkZDJjP+v1HywR1ICbS+fCYCQkLdjVGy7EpcyiTqP6HK4GzJ8Wpjlb2MnSCQkqJWK4UdgxjGTg2l8fs=
X-Received: by 2002:a92:584b:: with SMTP id m72mr6673331ilb.95.1586975641598; 
 Wed, 15 Apr 2020 11:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200415174318.13597.99753.stgit@localhost.localdomain>
 <30194715-bd6d-42df-2de0-6d54ad5a1136@redhat.com>
In-Reply-To: <30194715-bd6d-42df-2de0-6d54ad5a1136@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 15 Apr 2020 11:33:50 -0700
Message-ID: <CAKgT0UdVA48iUzd45tG-S-Md8Cb4S90aztcUgs4H5sLX-W9XkA@mail.gmail.com>
Subject: Re: [PATCH] virtio-balloon: Avoid using the word 'report' when
 referring to free page hinting
To: David Hildenbrand <david@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Wed, Apr 15, 2020 at 10:46 AM David Hildenbrand <david@redhat.com> wrote:
> Can we also change the comment of
>
> #define VIRTIO_BALLOON_F_FREE_PAGE_HINT  /* VQ to report free pages */
>
> ?
>
> Thanks!

No problem. I will update and submit a v2.

Thanks.

- Alex
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
