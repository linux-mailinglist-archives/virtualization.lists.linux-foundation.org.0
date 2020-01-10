Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6FE13672F
	for <lists.virtualization@lfdr.de>; Fri, 10 Jan 2020 07:13:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CDEAF883F8;
	Fri, 10 Jan 2020 06:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xF2JDHW+u0c0; Fri, 10 Jan 2020 06:13:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66920883F5;
	Fri, 10 Jan 2020 06:13:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49625C0881;
	Fri, 10 Jan 2020 06:13:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93F23C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 06:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 902F186B04
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 06:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQqS1VjXlCBM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 06:13:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AB800869B6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 06:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578636785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JUb7J5k9pHQGDMgWElpRTaa3UN/XQp4RFy7vMyL+c3E=;
 b=iX04FDuafdD8b8vZGBE1+PhCQ8w/njG36vT4nuLrdtzLjRawnPFhxJjRPFHoyh1Nu331qW
 qcqrRGfA2msshO+0TiYvAkd4PYiA12bsBeYY7sg3AxiPckQdpLoaZFr6ZHhsWNTg3xBIyE
 K682Fnhu1LyG6MNLUiapegPStNcILwM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-x9BNYs4-N_a7C-MJOqE8AQ-1; Fri, 10 Jan 2020 01:13:03 -0500
Received: by mail-qv1-f72.google.com with SMTP id l1so515975qvu.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jan 2020 22:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JUb7J5k9pHQGDMgWElpRTaa3UN/XQp4RFy7vMyL+c3E=;
 b=XO4rtjVYSW6ZtmTRtM1wQmStNI0ZLIKninp3YSBctBljbIhyqK1lsUTdQ8hP4boMNd
 j5jSmy6KKHJZjO/hQT1m/YExvBjzbCDk5ZVqhyr1PbbWKOzyldJqyGawdX8ypQqmkHIU
 uN5P+HBxRPtJ6dWGb8LLnjMz2d5JGLBVcalMorJ0PzKKyMuQkXzOJL1S4h65HSK0PQlV
 eXTVjBf0RyaC9VxgvmsZv1FfgWb07lhXHcI9yJIqB/+QyFA5VWSGDlliEr/IOUtz/Ekn
 riNYk4ARh0Xxn5XiJlCKx9HjeAZSAvxMqshFrWVn41GVG15XZXrONzkTXFKasa/jpS00
 EM4Q==
X-Gm-Message-State: APjAAAUXjWXeRO4N9z1G1eJyyNis7bFn5mEAGLuRrZaqXH1lL7m55Z3P
 KKbY9cTk5xJLxCX50K/ru86UxN73hOofbcnhysXC2HOYLyBl4NFacHP+R7qG0Wb4+K4s4CMaBMO
 xprd4mpDtFtQ3tixKQGQluWD2f23fuHMgQQm4JOYnIA==
X-Received: by 2002:ac8:6697:: with SMTP id d23mr1080350qtp.350.1578636783318; 
 Thu, 09 Jan 2020 22:13:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqyEBnt7IxTIASPQRiXS/2qwYjQd4GY3gTOeHUpypwIPSrQCqrkSOQtY6sfsyfysgAniCEZu/A==
X-Received: by 2002:ac8:6697:: with SMTP id d23mr1080336qtp.350.1578636783113; 
 Thu, 09 Jan 2020 22:13:03 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id z3sm546702qtm.5.2020.01.09.22.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 22:13:01 -0800 (PST)
Date: Fri, 10 Jan 2020 01:12:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
Message-ID: <20200110011236-mutt-send-email-mst@kernel.org>
References: <20200105132120.92370-1-mst@redhat.com>
 <20200109.183339.173768060466817001.davem@davemloft.net>
MIME-Version: 1.0
In-Reply-To: <20200109.183339.173768060466817001.davem@davemloft.net>
X-MC-Unique: x9BNYs4-N_a7C-MJOqE8AQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: adelva@google.com, willemdebruijn.kernel@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Thu, Jan 09, 2020 at 06:33:39PM -0800, David Miller wrote:
> From: "Michael S. Tsirkin" <mst@redhat.com>
> Date: Sun, 5 Jan 2020 08:22:07 -0500
> 
> > The only way for guest to control offloads (as enabled by
> > VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) is by sending commands
> > through CTRL_VQ. So it does not make sense to
> > acknowledge VIRTIO_NET_F_CTRL_GUEST_OFFLOADS without
> > VIRTIO_NET_F_CTRL_VQ.
> > 
> > The spec does not outlaw devices with such a configuration, so we have
> > to support it. Simply clear VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> > Note that Linux is still crashing if it tries to
> > change the offloads when there's no control vq.
> > That needs to be fixed by another patch.
> > 
> > Reported-by: Alistair Delva <adelva@google.com>
> > Reported-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> > Fixes: 3f93522ffab2 ("virtio-net: switch off offloads on demand if possible on XDP set")
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > 
> > Same patch as v1 but update documentation so it's clear it's not
> > enough to fix the crash.
> 
> Where are we with this patch?  There seems to still be some unresolved
> discussion about how we should actually handle this case.
> 
> Thanks.

Once discussion is resolved I'll post v3 with updated commit log.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
