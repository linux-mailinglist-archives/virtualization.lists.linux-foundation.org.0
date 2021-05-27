Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6BD392F63
	for <lists.virtualization@lfdr.de>; Thu, 27 May 2021 15:23:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C1C4068B;
	Thu, 27 May 2021 13:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXW3C2xiNnZi; Thu, 27 May 2021 13:23:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 673F3403B3;
	Thu, 27 May 2021 13:23:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2EB1C0001;
	Thu, 27 May 2021 13:23:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22477C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 13:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8C7D83D64
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 13:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApjnB3HMwyrt
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 13:23:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2F1183A90
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622121781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aUqMjQnFHowCIpxoqGdHLFgcHkZJl9a5H4mk4+yVXTw=;
 b=I2Y9LFdnDam9O6NKLvpDXQTpo2YihOlfYB6roQMmjBVwM8PUi/qdXqntJvhvRXSfDG+6aq
 Axp8OK8RQhkbG/6VqLxIOSylJfmWm0+j5ySclfxK3/8MXpZem+E83E6wzljmkjLhW37Grn
 btzpQ6l5NwN8M8hXqW0uxqRgn9yV38w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-dkINpc0xMsWQ6RTQOQMMXg-1; Thu, 27 May 2021 09:22:57 -0400
X-MC-Unique: dkINpc0xMsWQ6RTQOQMMXg-1
Received: by mail-ej1-f69.google.com with SMTP id
 n25-20020a170906b319b02903d4dc1bc46cso21716ejz.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 May 2021 06:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aUqMjQnFHowCIpxoqGdHLFgcHkZJl9a5H4mk4+yVXTw=;
 b=o9tbqUZh5V2nCIkeRGzC/hj/wZhXkbxz1kw/Fy5hOxbTSLyBJMX/GX4K+jB0aVtrZa
 SP8V4ilX3LGjHT26BS3kvOhfIEY4rcUDwSSWRqG2gkaRF+k8p/BvegIBhXhprlesSewu
 2/XNgQowri/46cdZPNkB3Sa7sZxzDj8XBDrBtzX/iTil0YreP8dQut6+5TVUx5Fn3wAb
 jlyNh5y1FJL2abmaEYqC0lBhAxcitscbLUoYqwPgdwzMzyAD4/MgBKL4QuynAg0M3MnR
 gS3vr73gToN2kpn6xvQD+XTMGe6x7q3vAj/cr+9Vcb9qFcGVbaRF0bw18ZUrWt9i2idW
 +U7g==
X-Gm-Message-State: AOAM530YX9KJaoMEggkHlDUQUQM7Dz/tEREhH8zDzPwB+YbHGNjKsTum
 YRt2RQd2Ea8npBggQ0+WGaGk4bCdILNlZpGUyV8Bhx6mES3T+Xj6b1YDKLmK2rYvHNSwuyMF98h
 Gfj1i5TxUWCmnqntmmRVtATdA52P6eXXtU43rISrHkA==
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr4160702edt.194.1622121776510; 
 Thu, 27 May 2021 06:22:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTLpW23FL3nEka+3tyXPIXrAkuMHRFepLMTuuCuBIggWGutKrctUmLwXk2eoGHvNtAVLDGiA==
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr4160671edt.194.1622121776310; 
 Thu, 27 May 2021 06:22:56 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id t9sm1146544edf.70.2021.05.27.06.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 06:22:55 -0700 (PDT)
Date: Thu, 27 May 2021 15:22:53 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 1/5] vhost: remove work arg from vhost_work_flush
Message-ID: <20210527132253.icav3xnbg46cwawv@steredhat>
References: <20210525174733.6212-1-michael.christie@oracle.com>
 <20210525174733.6212-2-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210525174733.6212-2-michael.christie@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>, linux-scsi@vger.kernel.org,
 mst@redhat.com, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, stefanha@redhat.com, pbonzini@redhat.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, May 25, 2021 at 12:47:29PM -0500, Mike Christie wrote:
>vhost_work_flush doesn't do anything with the work arg. This patch drops
>it and then renames vhost_work_flush to vhost_work_dev_flush to reflect
>that the function flushes all the works in the dev and not just a
>specific queue or work item.
>
>Signed-off-by: Mike Christie <michael.christie@oracle.com>
>Acked-by: Jason Wang <jasowang@redhat.com>
>Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
>---
> drivers/vhost/scsi.c  | 4 ++--
> drivers/vhost/vhost.c | 8 ++++----
> drivers/vhost/vhost.h | 2 +-
> drivers/vhost/vsock.c | 2 +-
> 4 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
