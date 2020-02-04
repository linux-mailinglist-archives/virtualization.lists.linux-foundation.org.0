Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5B151596
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 07:02:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24D8282FF1;
	Tue,  4 Feb 2020 06:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Od+gZ00DiOzG; Tue,  4 Feb 2020 06:02:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D18682507;
	Tue,  4 Feb 2020 06:02:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FAE9C0174;
	Tue,  4 Feb 2020 06:02:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D25A0C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 06:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C358A82FF1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 06:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KC3iZnLaXYmP
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 06:02:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E19AE82507
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 06:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580796120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RjdsRkXe77yTljkA9sXafvBdByUVdvxrTgCwvbrVV0w=;
 b=IbZjKwymJRgcTd3G6CGpLYAAv/ZFkF/CWUlC6k+vRLFkS2YTObk0LNK01tDBooKAUPWT5K
 M384Klin7NjILn5tULnraagONCrQx9R5wNKPiT6m6BmgtQBMB2kRpxVLeD0UKTT+wUp02O
 JRZusD1TMGIr4V9rW38iELK/zhKy2gw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-WVee8XqrN4ySHwjpqXy29w-1; Tue, 04 Feb 2020 01:01:58 -0500
Received: by mail-qt1-f199.google.com with SMTP id e37so11658962qtk.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Feb 2020 22:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RjdsRkXe77yTljkA9sXafvBdByUVdvxrTgCwvbrVV0w=;
 b=FgXmmaBSw6I+tySOQIczLG8aNK7Wv0NgXNS6p0dzfJo77Ja5Wd9GBhbgCK7ksLojiR
 DcVMPRhLxxMisVhaSMP1ySl+QPGzp6RW8Ym3gZbRqjnV2Ros9p0sZGf0uLMz4L1mphIV
 ASi3wazLyZhjxuc96cr575liJzGO7d7ry68Kpq67XvjGyGebnpjvpRBHuUwQZkdyDGlg
 NwGm2JCedXnMDXMQffF45n9atWqapTPN9VMZ3E8ASi6knOiU7Vw8bsNwWG/gIs0jxnu/
 pmaKqzB6ZQDtXGbr5Wo51yOX1OV9M6WXciuM0tk3X/XZX7G0h7Jv86MXsOHSSBOoesnt
 w2vw==
X-Gm-Message-State: APjAAAXByJ8RQy6k0tf8KOPaWS7RrbH9XlNLJzN1Atped8oNg4IwxGnK
 z65M1IskgoUABZKG5M4+Uf/D9kW4G1P5MWroIzGu4/NA5eHFR58hX1lmD6eyzUmPHJ3205afy12
 3XradrkAhPXbThvrzeOFq1lH8A066v6C344nF4RDdUA==
X-Received: by 2002:a05:620a:102c:: with SMTP id
 a12mr25836908qkk.95.1580796117495; 
 Mon, 03 Feb 2020 22:01:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdvK3Ipy2qMCfUzq1ylzYT9IbitByfrekyORfLE2eptvuEIqJ12IuGLk9Wtkttgxshu+/I4A==
X-Received: by 2002:a05:620a:102c:: with SMTP id
 a12mr25836873qkk.95.1580796117247; 
 Mon, 03 Feb 2020 22:01:57 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id u24sm10612793qkm.40.2020.02.03.22.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 22:01:56 -0800 (PST)
Date: Tue, 4 Feb 2020 01:01:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200204005306-mutt-send-email-mst@kernel.org>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
X-MC-Unique: WVee8XqrN4ySHwjpqXy29w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, jgg@mellanox.com,
 rob.miller@broadcom.com, lulu@redhat.com, maxime.coquelin@redhat.com,
 hch@infradead.org, eperezma@redhat.com, haotian.wang@sifive.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 zhihong.wang@intel.com, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, hanand@xilinx.com, lingshan.zhu@intel.com
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

On Tue, Feb 04, 2020 at 11:30:11AM +0800, Jason Wang wrote:
> 5) generate diffs of memory table and using IOMMU API to setup the dma
> mapping in this method

Frankly I think that's a bunch of work. Why not a MAP/UNMAP interface?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
