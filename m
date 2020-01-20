Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F511142A62
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 13:17:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B3AC84EC0;
	Mon, 20 Jan 2020 12:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpxrMgkkuL3P; Mon, 20 Jan 2020 12:17:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3BD086038;
	Mon, 20 Jan 2020 12:17:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6143C0174;
	Mon, 20 Jan 2020 12:17:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3646DC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1D45486038
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkPm3Cpfrxtd
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:17:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0237584EC0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579522657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8L+ILVTS7iEVpEf9FQ7Niyp0BU3VQIiebmcN8SzOcl8=;
 b=Q8jJfz8kyQyUMTq+IqvBSU4xbhlSH9LCcDAIZk5+hsFJTxy9yMXVXtc0X/wvSkx+ykf66Q
 ttNo9gVr8SXSpg3wS/nySmKhQEqoIUSAVzraxC/kXD8JBTvYO2H/vDUGf32YfZJhNU2vRM
 uXaJUloQwg1Pf7GxPEsxVZJDV9WTUDs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-BjiRG6CAMRKDbnVmOMa5gg-1; Mon, 20 Jan 2020 07:17:36 -0500
Received: by mail-qt1-f199.google.com with SMTP id e37so21007549qtk.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 04:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8L+ILVTS7iEVpEf9FQ7Niyp0BU3VQIiebmcN8SzOcl8=;
 b=VVoRX80k/tfPhNW55Ye7VW2zq7ddWyhxkQgZsMs+NdbT5YWv+wxrV9ibMuYnH/szrE
 pRYunpFYm3q/WFlKo1jDAbqupz5SktibCfzS22a/5vCFyfYQVYtDOAxaxIjoU/eh4R7f
 A63nSmUulhF9vXSuB5hmfgt6VdLpaN3iN3bMHpRkifpPCj7+wsygfl2csZuiQ6hsEBCD
 SSJZvkmGHvcDwcZQvRzygjCAiybes2QukWINu1wNXBXEdboadLMzkOo65aXTjcSHlNZj
 StSKt4+WnOdWG8WUmQmTZQQfZrdiw1W5yjBiVrSWbumUyKNw1LO6mlpyZBQq74vt+ZjG
 HUwg==
X-Gm-Message-State: APjAAAVIp6IyiD6dhTzm73mTHrQl73alD84wb9sSWaqwG2G7ANjw1YXM
 x4NM6WbCuA485cB/rURYnTvHiNsB7nHu78VpWSnCUHxl+IdL6gBtUj8hnIYQRCvpb+7p9bri4z/
 BP3iDM2Uvv1noHw67yWHYVaiSPCsCi2h0WNOH6q9MNg==
X-Received: by 2002:ac8:784:: with SMTP id l4mr19850127qth.286.1579522656242; 
 Mon, 20 Jan 2020 04:17:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwNA60FKJeMn0/BVl0tQjIyzqQrUvdMi0GrHZyiN0uIGAcUXWQkWAFroQqD7gDCIK6n3lBLSQ==
X-Received: by 2002:ac8:784:: with SMTP id l4mr19850095qth.286.1579522655996; 
 Mon, 20 Jan 2020 04:17:35 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id y26sm17884235qtc.94.2020.01.20.04.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 04:17:34 -0800 (PST)
Date: Mon, 20 Jan 2020 07:17:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200120071406-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200116152209.GH20978@mellanox.com>
 <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
 <20200117135435.GU20978@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200117135435.GU20978@mellanox.com>
X-MC-Unique: BjiRG6CAMRKDbnVmOMa5gg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

On Fri, Jan 17, 2020 at 01:54:42PM +0000, Jason Gunthorpe wrote:
> > 1) "virtio" vs "vhost", I implemented matching method for this in mdev
> > series, but it looks unnecessary for vDPA device driver to know about this.
> > Anyway we can use sysfs driver bind/unbind to switch drivers
> > 2) virtio device id and vendor id. I'm not sure we need this consider the
> > two drivers so far (virtio/vhost) are all bus drivers.
> 
> As we seem to be contemplating some dynamic creation of vdpa devices I
> think upon creation time it should be specified what mode they should
> run it and then all driver binding and autoloading should happen
> automatically. Telling the user to bind/unbind is a very poor
> experience.

Maybe but OTOH it's an existing interface. I think we can reasonably
start with bind/unbind and then add ability to specify
the mode later. bind/unbind come from core so they will be
maintained anyway.
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
