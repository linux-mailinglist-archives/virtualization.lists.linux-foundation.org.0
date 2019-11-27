Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8522010AECC
	for <lists.virtualization@lfdr.de>; Wed, 27 Nov 2019 12:38:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D31288216;
	Wed, 27 Nov 2019 11:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGH3OoKZ8Tag; Wed, 27 Nov 2019 11:38:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C1B1A87ED9;
	Wed, 27 Nov 2019 11:38:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD697C1DE1;
	Wed, 27 Nov 2019 11:38:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9A45C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C5D3C8820C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzsR1mkTAR7W
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:38:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0DF6A87ED9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574854722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5tpEqO+wGu590B9l8gWu8dMstk0LXzAJSva1FoVaD0=;
 b=aJJbxyhNxYTb8faSR85v2MlvwHREeShFZ5jg7xGgbDvUjCNRipMMTM+UOVZAGHRI3yTC6X
 +W0GE5JmfEKIWHhcnenwb8K5idDfSNozL2KSuijAGwKxnsgjP1QxDr7kB7iJFCUkCTtEfm
 MkVRGFfVnU+BVdiluBu3fAEHI18HtDA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-Bl7-mu0EPIe5Q-GNFuHNkA-1; Wed, 27 Nov 2019 06:38:40 -0500
Received: by mail-wr1-f72.google.com with SMTP id m17so11991202wrb.20
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 03:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gB/Wj4XkNOl04gutjt7FkVMp5zt/tHRhcrcqk436DGA=;
 b=QLv3kw5AaqGt1vjlFFHXuEsuaiCSqN+f4Ax09trHYbBpx7reZpAEMx3oBSNBXoeQru
 n9DdbZj7DImTN/yD9dfLzZYA5XaY1v8yHAbRJ5L30qM7o5wEU4w3jhOn9ByM4kfYTZ3p
 W4TxR8QYN1HxDgepgWMvwYMWq0AImvKI5uMaro7+uK4H9JNsig607GjcKhHTQbUniRPM
 LrI7E/wbJVY89ai0JEObQN5+QnjsK5sN+DNmKYFaRKUsr0Qn9JfG5ZD/NEf+GGXhjaUY
 9VVA1z4m8erAa34pj0hdF/bzW6+GxfL7uFWPqSO7ToTEG8l2+/pcaU0RN5hxYCNl4ixO
 D+JA==
X-Gm-Message-State: APjAAAUJAi4lKtWCl9/t/qc27HWu6xLAKwHp5W4Brylfw+XJ7dXJVXdD
 aNq2Nh7p9IdpiRrBxPOHtEoE9ygupyspmpAt52gQ6Vsipvw0Uzf/mZBxKc3ghyXbeeSx28c3E6q
 iSU/S1Q+c3aHb/keaKIZjCaru7x2zIc6zcQHdVFmyWA==
X-Received: by 2002:a05:600c:249:: with SMTP id 9mr3850245wmj.2.1574854719517; 
 Wed, 27 Nov 2019 03:38:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxKFhYNt/5OmFRFNm0SplAax2A8tbao8cCbRdGJOTR3SFH21/IDFCvk/lfdGlETDTJsaX8dg==
X-Received: by 2002:a05:600c:249:: with SMTP id 9mr3850228wmj.2.1574854719334; 
 Wed, 27 Nov 2019 03:38:39 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id w11sm20128184wra.83.2019.11.27.03.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 03:38:38 -0800 (PST)
Date: Wed, 27 Nov 2019 06:38:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [net-next V3 0/2] drivers: net: virtio_net: implement
Message-ID: <20191127063624-mutt-send-email-mst@kernel.org>
References: <20191126200628.22251-1-jcfaracco@gmail.com>
 <20191126.140630.1195989367614358026.davem@davemloft.net>
MIME-Version: 1.0
In-Reply-To: <20191126.140630.1195989367614358026.davem@davemloft.net>
X-MC-Unique: Bl7-mu0EPIe5Q-GNFuHNkA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org, jcfaracco@gmail.com,
 virtualization@lists.linux-foundation.org
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

On Tue, Nov 26, 2019 at 02:06:30PM -0800, David Miller wrote:
> 
> net-next is closed

Could you merge this early when net-next reopens though?
This way I don't need to keep adding drivers to update.

Thanks,

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
