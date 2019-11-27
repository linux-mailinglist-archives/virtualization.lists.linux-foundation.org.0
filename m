Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA510AED1
	for <lists.virtualization@lfdr.de>; Wed, 27 Nov 2019 12:41:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB1FD87659;
	Wed, 27 Nov 2019 11:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9rUqDlvWafe; Wed, 27 Nov 2019 11:41:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 367FE87618;
	Wed, 27 Nov 2019 11:41:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18EADC1DD5;
	Wed, 27 Nov 2019 11:41:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 390ECC0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2DC5A86ACB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LaTM0+End4Po
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:41:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 44957869C4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574854860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u2MTh3sn/YgUzo7BT+awl8HsuGfDfwhUCejX1QPvEAw=;
 b=VkDxup/CWAzfk94Ajn5DPX13+Ot2LL77MUvNFfqH0dYX2fMEvj552vgpceEqiEm5IK5o8p
 Ls0tjuu8xnphpNMr5DP6PjAG/xCEhzkla1jqJg16YjARL7rEhuTdlffSRo33iEz/oFa3sM
 llDgy8tLboEom6r+G7OydeaK3othG90=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-4XR-JlX1MGCTtVF6suVl6g-1; Wed, 27 Nov 2019 06:40:57 -0500
Received: by mail-wr1-f69.google.com with SMTP id d8so8102478wrq.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 03:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nZ69cqNkgRpKOiZ3h2rwuEogSUZ9kEE8/cm9II5vyBg=;
 b=pG2xJXL8vljCx7PlmzEZdoAi8ZFvjvSOIo2KZJELhHrt2sCCdF2LxbFq630GwKGCSJ
 IidaLYhn8tKnK1kJrzNhKpEsV076HjUKCIbrOXHNROLEHCDufnJYmSHiV/G/q5IiDaqY
 h1miudg+Xux9QFOsGh44lvxkmht21XFTYXbTZ52ZxTjg7q47leqQ+jc6DgCBLjbJH0GU
 lAlcdo4sbpB8V3hrmoZf1UycY0GmFOxEo0W5ehI1CeDqkWt1NHVcGtbxFbj8A7s36SOg
 yzNcpqd5NFZaYggtgxlPvAHaBTJvzuDlXTzrPdEq5h1J7wbMVmSRyvH5UZmBYXbyaU0l
 1J2g==
X-Gm-Message-State: APjAAAUEkf864YSSagMTdyD/5+CCb1wMEoIG2DDKKUJKpmbWcKZEDUjC
 FcMd9dU21Pn50lUjeGCcXyO43Dfxx/yuIuQuGOsfKTU3Dl03a9VjS1qVCVtk7a5IJyOY9RerHWM
 xjiU/8ejc7Tgaugmr9mENwBNe0Z+g4oT35PX64Csnyw==
X-Received: by 2002:a05:600c:2944:: with SMTP id
 n4mr3955911wmd.57.1574854856476; 
 Wed, 27 Nov 2019 03:40:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZ/QBEsQ+X1s4efkDz9dRO4IGVX6KoJpp1ZLnXg0uOuyaTXWEfcsMy9j8KVa0jIkfLV3LMdg==
X-Received: by 2002:a05:600c:2944:: with SMTP id
 n4mr3955894wmd.57.1574854856346; 
 Wed, 27 Nov 2019 03:40:56 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id u14sm19057119wrm.51.2019.11.27.03.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 03:40:55 -0800 (PST)
Date: Wed, 27 Nov 2019 06:40:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [net-next V3 0/2] drivers: net: virtio_net: implement
Message-ID: <20191127064037-mutt-send-email-mst@kernel.org>
References: <20191126200628.22251-1-jcfaracco@gmail.com>
 <20191126.140630.1195989367614358026.davem@davemloft.net>
 <20191127063624-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191127063624-mutt-send-email-mst@kernel.org>
X-MC-Unique: 4XR-JlX1MGCTtVF6suVl6g-1
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

On Wed, Nov 27, 2019 at 06:38:39AM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 26, 2019 at 02:06:30PM -0800, David Miller wrote:
> > 
> > net-next is closed
> 
> Could you merge this early when net-next reopens though?
> This way I don't need to keep adding drivers to update.


I just mean 1/2 btw. I think 2/2 might still need some work.

> Thanks,
> 
> -- 
> MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
