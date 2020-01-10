Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7AC136F49
	for <lists.virtualization@lfdr.de>; Fri, 10 Jan 2020 15:27:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 925F687DB1;
	Fri, 10 Jan 2020 14:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4+ZFqdPFd0t0; Fri, 10 Jan 2020 14:27:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3554B87E5E;
	Fri, 10 Jan 2020 14:27:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15E9DC0881;
	Fri, 10 Jan 2020 14:27:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB376C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 14:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 948FC87E23
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 14:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3m4tibckvfC2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 14:27:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1FEA387DB1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 14:27:14 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id a67so1977638oib.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 06:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5TcuAQkmRiwoqdLSJS6JTYiOGLP/QjfJC3ke5FsTXG8=;
 b=QQUtNh5zpMO+es8jtL5Huhx44/oUYSq9UkPHgRekDBCIAX7bDk5S/8XnrlzK2uM9Ja
 zvCYnT4jYammyV3cplBHFo/zfdpxeA4ZK+j/1ngUc0tqalMlT/uJUjpLBUlvH4QivqoA
 gb7QL/liN+RAqLtw5w+A9ExIx15LEGwOwL9GoSz5jTwu1WH6liTDrsei8gdVVFrNA2/x
 hRA/ArvUdOm6LrjbLX2Or9AvwdO1E/QThIgvvBAYA5DY8ywiTLCb96NpkUBDRhJfcxsw
 PUo5TJhmJqRnuhxuiVAji1AtkaA+fL+OUafBwZkrtknMIQ+2WsRjNdY87uMepWTTKbAL
 sz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TcuAQkmRiwoqdLSJS6JTYiOGLP/QjfJC3ke5FsTXG8=;
 b=eOXXQsgNyIan18/F0/U1QYqnYFEfg2SBcstXAl65L1D2SEEOmFLgy1/NfYq+2rVs4T
 YJMLdrxtvyS6ftuKiKME9zxd5gHhf1NpWYyfOB8Ot90vzXM+da4YHVyAQkZmzhurzSuh
 Db0yt9FgP50VbLWTjbfDD0REGELh64YUQ2D+IjqqcHrci6MuQtq01WXvD163CCIVB8sT
 WiFx87nbK5kewcoe32+fdt7ma7dwY18834ZDh1GCCsV6cG6UNpAmguspbGykYGh0gF0p
 UWcOpYnSr3vtioFsgU7oo79NDPzb0GubLtl6SgJF9dCqo3Ih+G58O6kJ/Q65MiAoHvCv
 b4sA==
X-Gm-Message-State: APjAAAWhv9JjRdPoc1iqagO6aqMNbTKD/ZCW/5XWQvLOcx91g4V1N3TP
 FIb+cbUyq0RZo+ZN+2PVSISy3pqF0CzyMFt8B00Q4w==
X-Google-Smtp-Source: APXvYqzJICcxFN3gQb2rNRQ6JHRvBjVW+UtXYivPPLM9eyQgilX8UtH1y4dVV3TYuMn+dM3geKzplvKp5yscEzr13zY=
X-Received: by 2002:aca:c7cb:: with SMTP id x194mr2459757oif.157.1578666433070; 
 Fri, 10 Jan 2020 06:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20200110094535.23472-1-kraxel@redhat.com>
In-Reply-To: <20200110094535.23472-1-kraxel@redhat.com>
Date: Fri, 10 Jan 2020 15:26:46 +0100
Message-ID: <CAG48ez0wfLkTqdBtDBV4b1uUQMGeeAr09GPPi9WT++Fn8ph4rA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: add missing virtio_gpu_array_lock_resv call
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
 Chia-I Wu <olvaffe@gmail.com>
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

On Fri, Jan 10, 2020 at 10:45 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> When submitting a fenced command we must lock the object reservations
> because virtio_gpu_queue_fenced_ctrl_buffer() unlocks after adding the
> fence.

Thanks a lot! With this patch applied, my VM doesn't throw lockdep
warnings anymore. If you want, you can add:

Tested-by: Jann Horn <jannh@google.com>

> Reported-by: Jann Horn <jannh@google.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 1 +
>  1 file changed, 1 insertion(+)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
