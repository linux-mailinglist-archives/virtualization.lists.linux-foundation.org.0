Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A5143F22
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 15:15:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 02C2A8656A;
	Tue, 21 Jan 2020 14:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLUAzqqcyg0T; Tue, 21 Jan 2020 14:15:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2376686566;
	Tue, 21 Jan 2020 14:15:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2642C0174;
	Tue, 21 Jan 2020 14:15:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9532BC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 87BA887541
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nnf4iIXTYLQN
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:15:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C96B58753F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579616127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0ISVuuIVoP4ewOzYniLTSVuw4vxN7wzv55HQyIkjTg=;
 b=CXnO8mIcUfZpJHPglE62MT8/3SB9SlKnO1rQlWH4ic3gVjx4VANHmzqTNC+Hjekkvecvw2
 UiiQ2DCC487ff4njEqeYR/wCGO0jWSmn+C6AkR18P9ZWQjQEYpWDRtoj8Wsbovs00ZB1wY
 zplB8EWgpuVan1wih92HPJD5orXaV7Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-YJjFYgtsOeuQQA_qrkm9fg-1; Tue, 21 Jan 2020 09:15:25 -0500
Received: by mail-qk1-f199.google.com with SMTP id x127so1819746qkb.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 06:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W0ISVuuIVoP4ewOzYniLTSVuw4vxN7wzv55HQyIkjTg=;
 b=Zmfd7SzhH8TnhitjEG3KOIeI/y4GK59P2W3p6pP2jKF5nXC00eJVUPqAreuWVjibyF
 Mq92GkanJTk/jCXnybu/X/MC9woD50FvIX6R7AbYw2aC/MsiMzkSjgCnYiIWw2FW5kQV
 OWPT8C4JVPjhV5Jdtebvck72SY3eyhZYjRxjKvOy0DwjzNdeHQVVm1rV3ZvlVfuYIkUl
 oSNKGDX9RILbI/EYwYAAUD2r+9mP1Ja97RtVFi6uhzxHhPcEba+kJT0OrNpER6Ffoi6t
 arDrJMUEqnGa1Y0ttpaQWUkf+DRerzceVbj4TnCo5X9B0oSxXoowpRxi4dLbAlGaN+1y
 D3ZQ==
X-Gm-Message-State: APjAAAVEP6746rkurbKk0/TICYw69XW2dbtYEcwsdX9ePt4avbkcfuB9
 R4sbmfkbUYCgdPeE9S3X08dSpwLTx8rPw8yMaAraK4Va+wZ8T6tt7l4sVriOGv7u049zppnDM3v
 7i/pmLIiSJJxe6V2WhNJuJRHMnUJQHMks1mI2229GjA==
X-Received: by 2002:a05:6214:1907:: with SMTP id
 er7mr4996648qvb.199.1579616125389; 
 Tue, 21 Jan 2020 06:15:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8AFk0N0aDDxiY+h2t6Rh1k1ou2Ux/pEPzCq29EZUwXk9nLKkey+jnpSszBH9mQmuAKQMoKA==
X-Received: by 2002:a05:6214:1907:: with SMTP id
 er7mr4996599qvb.199.1579616125108; 
 Tue, 21 Jan 2020 06:15:25 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id o16sm17323139qkj.91.2020.01.21.06.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 06:15:23 -0800 (PST)
Date: Tue, 21 Jan 2020 09:15:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200121091456-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200116152209.GH20978@mellanox.com>
 <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
 <20200117135435.GU20978@mellanox.com>
 <20200120071406-mutt-send-email-mst@kernel.org>
 <20200120175050.GC3891@mellanox.com>
 <20200120164916-mutt-send-email-mst@kernel.org>
 <20200121141200.GC12330@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200121141200.GC12330@mellanox.com>
X-MC-Unique: YJjFYgtsOeuQQA_qrkm9fg-1
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

On Tue, Jan 21, 2020 at 02:12:05PM +0000, Jason Gunthorpe wrote:
> On Mon, Jan 20, 2020 at 04:56:06PM -0500, Michael S. Tsirkin wrote:
> > > For vfio? vfio is the only thing I am aware doing
> > > that, and this is not vfio..
> > 
> > vfio is not doing anything. anyone can use a combination
> > of unbind and driver_override to attach a driver to a device.
> > 
> > It's not a great interface but it's there without any code,
> > and it will stay there without maintainance overhead
> > if we later add a nicer one.
> 
> Well, it is not a great interface, and it is only really used in
> normal cases by vfio.
> 
> I don't think it is a good idea to design new subsystems with that
> idea in mind, particularly since detatching the vdpa driver would not
> trigger destruction of the underlying dynamic resource (ie the SF).
> 
> We need a way to trigger that destruction..
> 
> Jason 

You wanted a netlink command for this, right?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
