Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 222AA1F4C8E
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 06:47:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A486C881EB;
	Wed, 10 Jun 2020 04:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWLJVLmWuVXa; Wed, 10 Jun 2020 04:47:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3424E881AC;
	Wed, 10 Jun 2020 04:47:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04E56C016F;
	Wed, 10 Jun 2020 04:47:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2524BC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1478A88161
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElwiZcS9KrqD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:47:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 342BA8815F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591764449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NeTlc9sPhZVDG8KcvimBjPS6Un15nH1O93qMq/SgmMI=;
 b=Y1xNMBnnZKDhdEXyF1wuDHKjyyB73RJjQMlIAmVWLR0pU3uoV/N9rBoTbqB9OUfTHjmWD0
 0j87xe9aGbzhyQRPhkwEsR6OQwYOyzFbnjyuDWAt23SekO4CIuMuyt04PvcwapxDf3r9J1
 r+sSGu1/grIOMt6ksv9QP12BWL6OrjQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-4cmnYhFAPPqIL401pX9Hrg-1; Wed, 10 Jun 2020 00:47:27 -0400
X-MC-Unique: 4cmnYhFAPPqIL401pX9Hrg-1
Received: by mail-wr1-f72.google.com with SMTP id l18so539847wrm.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Jun 2020 21:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NeTlc9sPhZVDG8KcvimBjPS6Un15nH1O93qMq/SgmMI=;
 b=HSg1FhRAv69lY5HQERpOZbeEawB0iIzaAQvUqbV5CBwbnnrYwlISM/bYGgaeGNPQJF
 tRC5m06aUtGnJa1QAoFps3esHHGb2vhbRE9rzjM+GCBr3xZpPNFjtGunat7TOMv6tHln
 UYYpiyU0NxvhXmV/cVS+c8+RD3u/3Nj2D/Z6J7l9DJn8jrYi3VBLA4Eu4Pyv4zB0yjMZ
 PpYUi+diekj1Ex5ATZTMfOoxqAhuOfofRdgGYQ+/NTGUgrDzEo8DFdwn0iu23laK+hgr
 15DZfgc6svPx59rzsh2msG3ZROFuT2noqCm6Iqlpnv9fjjAQeiYb19zNqarMbZ5eQviw
 liBQ==
X-Gm-Message-State: AOAM531srfWIRx7DaGOEVvGUfEYxDd2bjCMTQCp4FfAks5goG7ht7yFM
 1mVFvpZyR3aRGygDl7KX7pQPKq5C/qK4UO9F6nEeLK/7kb2t8BFBX3Fc3C4FjnOZ6zPxsNLTo+m
 5fsBhOUdBQqb/6TQWQW3GCiFN9Mnq/ls8HrkEelNLCw==
X-Received: by 2002:a05:6000:d:: with SMTP id h13mr1336235wrx.17.1591764446761; 
 Tue, 09 Jun 2020 21:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjvknjxW+aJPg3XelEu4wq8+jLzyY8z4CuAMV2ECaX7J8V3IhJFML1oaGO06sxcAfW/4487A==
X-Received: by 2002:a05:6000:d:: with SMTP id h13mr1336207wrx.17.1591764446562; 
 Tue, 09 Jun 2020 21:47:26 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id a7sm5618888wmh.14.2020.06.09.21.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 21:47:26 -0700 (PDT)
Date: Wed, 10 Jun 2020 00:47:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vdpa: introduce virtio pci driver
Message-ID: <20200610004641-mutt-send-email-mst@kernel.org>
References: <20200610035920.12078-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200610035920.12078-1-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

On Wed, Jun 10, 2020 at 11:59:20AM +0800, Jason Wang wrote:
> This patch introduce a vDPA driver for virtio-pci device. It bridges
> the virtio-pci control command to the vDPA bus. This will be used for
> developing new features for both software vDPA framework and hardware
> vDPA feature.

The mail headers are mailformed here:

Content-Type: text/plain; charset=a

so git am can't parse it:

error: cannot convert from a to UTF-8
fatal: could not parse patch

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
