Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 939B61103FE
	for <lists.virtualization@lfdr.de>; Tue,  3 Dec 2019 19:07:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4814687C2C;
	Tue,  3 Dec 2019 18:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cw5LlqLEkniX; Tue,  3 Dec 2019 18:07:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C01287A12;
	Tue,  3 Dec 2019 18:07:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BAEEC087F;
	Tue,  3 Dec 2019 18:07:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85356C087F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 18:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6CB5787C2C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 18:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7j8gG+J-JzY
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 18:07:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E4FB087A12
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 18:07:13 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so1997116plp.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Dec 2019 10:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=/sxFBO+A4bmmlzeA7kuVL6WCWUyudTPsIA+QFiheH5M=;
 b=BAw/Dmnay1FLKQCIDZm7gksS5lhoF8Z8pN9rRw+7OMz3u6YDyu7z3zqsQPxKaUT5kQ
 HNyBORMDB003vrTmJ/ICK2nWe0X3SsrYlGRHuqmfAG0QDvTlw+lWuZhyWFExBGGiFbaj
 Em4mMOyfhrZj3nv3/oSol59HVfCLyDhAki2qhRoseCWCqaJwU/3P1bUAsq7UW0E1C6Y0
 ++PVI76pMnSdBJaQqS+19sszKnOCTSpuNPRcPvFpRlzscwFKE5BHiyFY4lygTOG3wL6k
 b16qMzks5zFEYvv8yQnkGojVS95Vm6a8zPGfTIh2kcVcMr/mfW0MkXJqxoBizSRIx+Tb
 ypmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=/sxFBO+A4bmmlzeA7kuVL6WCWUyudTPsIA+QFiheH5M=;
 b=kWAnAgyIG/InJGPX0A6rFnXOCgdon5cdNjd7fDxGd2y/xhyETP57RBjgREFea6SBSk
 CJkSfoNSwxmWoiXwBqspMR3EspuXQRdkxm8pbx+R4EvK6KVBMmrjkNtAZNjyEjFbTe0I
 PSMtKHS4QHEfRBMEP8lkzZVq9AWqLworD2uh653Xnz3YAEc166fM4G02s9BueNtrCcBJ
 OFxGW3KPxH8HZJ0KcEJUp7bZTpGPYO8GzXJG3yQilFuh8e3HC6jteYW3rq8NBSk1F6FK
 0JFXUNstuDTzAdo0cFEe0eejZPpoOxbSVciWTe/0/xYs+aM23JV9CqwBl/zhOUm4hQjn
 qjaQ==
X-Gm-Message-State: APjAAAWjAQqhUVih8tN4dYa9gKl6c4HOIKtEZnWnECE4H3NjWroME8xf
 /hXElPkUsJxVAU48wzTuJOfKVQ==
X-Google-Smtp-Source: APXvYqwg4cfBTLYScskl8BNpesAVZqxCCfCNlGvkZA2ZM13raINhG+LP2JI69AiqSD3T/ezOHPL4ig==
X-Received: by 2002:a17:902:8f96:: with SMTP id
 z22mr5932828plo.11.1575396433357; 
 Tue, 03 Dec 2019 10:07:13 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id h6sm4103397pgq.61.2019.12.03.10.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 10:07:13 -0800 (PST)
Date: Tue, 3 Dec 2019 10:07:01 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC v7 net-next] netdev: pass the stuck queue to the
 timeout handler
Message-ID: <20191203100701.0d6a367e@cakuba.netronome.com>
In-Reply-To: <20191203071101.427592-1-mst@redhat.com>
References: <20191203071101.427592-1-mst@redhat.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, jcfaracco@gmail.com,
 davem@davemloft.net
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

On Tue, 3 Dec 2019 02:12:48 -0500, Michael S. Tsirkin wrote:
> This allows incrementing the correct timeout statistic without any mess.
> Down the road, devices can learn to reset just the specific queue.
> 
> The patch was generated with the following script:

Still:

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
