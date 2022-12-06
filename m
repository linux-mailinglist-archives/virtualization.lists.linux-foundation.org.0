Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 50971644BB2
	for <lists.virtualization@lfdr.de>; Tue,  6 Dec 2022 19:26:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE7C81E5A;
	Tue,  6 Dec 2022 18:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AE7C81E5A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=XJPXSnXY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BTL6OSe0prs; Tue,  6 Dec 2022 18:26:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F381081E6B;
	Tue,  6 Dec 2022 18:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F381081E6B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 422CEC007C;
	Tue,  6 Dec 2022 18:26:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BE4BC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Dec 2022 18:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7553E40A67
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Dec 2022 18:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7553E40A67
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com
 header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=XJPXSnXY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IgkiRiHmfpig
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Dec 2022 18:26:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B070E400BB
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B070E400BB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Dec 2022 18:26:28 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id z18so813719ils.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 06 Dec 2022 10:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4IgAV0xIyvbwpM5yKjLqn+3xEvTqGQImla8lRmFjooY=;
 b=XJPXSnXYtqzyoEvG44PNoB+1gOv5k1OID8qM6iICUEPJA6HHkW4GMQrQVFvIJqguuk
 OGOdxnwkdbTGq6LjlVM1f27XJb3Ep44/YwPY7wrnw+/rNvpd4qJQuyoESdtuuvrdbeKH
 ao/8ht7AedDebOx4LiMMCtrbO4VSJ9fcjASSJ1g3EIQSvtLkUTsuLqR9ywJ1o5KwBaJb
 lzXZUB7AM29agYXILjmEyFzyjOjplMZHP6+hfWMxHw2ruxJf3CvI95Ue1gc0WcWxWvSo
 40cBJupRlPOhpXVpJVuRyp3hCjx8phcTIXoj8CbVh6dh2SOcqINnjOKbYxcS5XYdHwzg
 XEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4IgAV0xIyvbwpM5yKjLqn+3xEvTqGQImla8lRmFjooY=;
 b=xIKSGAT/SaF7XZjjlGWZdXMBzGDPyZz073dOyAH68H65H6hRFJy0WBLdiXouw7f31w
 JxkGgnSxBEEe6mpWjyTh2+17kHBcHkH9bI/4Yi9QoUUQaUYRCrACk+0sF/S0Epq3GRj2
 UHbX8izo+i8B6ajmdNogtgwnzwfsEP+iabCj/n6CaaNEe46ydOU+Zi3IdiFVzxIQbSFo
 HuvHT47qlrR4dw1zhntZbewMVGtQ9fuyVfzYqeS/CPfLi7Hfvj00xE88kBf9UzLxly7n
 YTgBqZQzuA74oMJNGZcL9qPPuZ3uT4DTUcgfYFNmBKfR8xkNDy0j5TsDWh4I7weJ4VVF
 B49g==
X-Gm-Message-State: ANoB5pnSSZSwDpVn4UuLcAqUByQgmOIRFwQD4k4FxbYQiQGxAjcu1Zzk
 CepPdiZg7jBP5/lENvwvAl5PQnWkxLb3JYYwUQta8A==
X-Google-Smtp-Source: AA0mqf4OFLTHTjVrQA6b2z/UjNJEshTdpsFl+xYEou0s/2/0KkWYoGxGNXdyK9Sb1If+AAfg1/RuRv752BxW7M+hQoM=
X-Received: by 2002:a92:d702:0:b0:302:8a13:6744 with SMTP id
 m2-20020a92d702000000b003028a136744mr31558581iln.52.1670351187587; Tue, 06
 Dec 2022 10:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20221205162035.2261037-1-alvaro.karsz@solid-run.com>
 <Y49ucLGtCOtnbM0K@fedora> <20221206113744-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221206113744-mutt-send-email-mst@kernel.org>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Tue, 6 Dec 2022 20:25:50 +0200
Message-ID: <CAJs=3_CfwV=gzgsM=PseLoigzU+CFOXHk=9Sy-SBro5HHn_uhQ@mail.gmail.com>
Subject: Re: [PATCH v3] virtio_blk: add VIRTIO_BLK_F_LIFETIME feature support
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
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

Thanks,
I will fix it in the next version.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
