Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5443D102
	for <lists.virtualization@lfdr.de>; Wed, 27 Oct 2021 20:45:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A4860B05;
	Wed, 27 Oct 2021 18:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YeFETcMJIMZ; Wed, 27 Oct 2021 18:45:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 63F2560B06;
	Wed, 27 Oct 2021 18:45:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E41AFC0036;
	Wed, 27 Oct 2021 18:45:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8963C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 18:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFEA9402D2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 18:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BogrcFUUU97P
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 18:45:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A9E1400F6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 18:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635360323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AE8uUoA0RuM1LER5viKtBIKx5xuRVYpElfenEqY9TLo=;
 b=N3yd9lhiZ30gGFRKDs+G6CaeFbQMliRpO5zyH2bqA7Eyg4D6uc71g+fYI8EgfLwbRc0Nag
 FhpAjTslhIJdF5D/1naXm8zEelAGSEIgTtM2TX57sT9a+7rBcRDj/aLa94IQJPh8WfGYdb
 0TBlon4EVMw+UR4+dEycszRzvGWfsJA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-EGwYYQPqNpGLQAyExBtcWw-1; Wed, 27 Oct 2021 14:45:21 -0400
X-MC-Unique: EGwYYQPqNpGLQAyExBtcWw-1
Received: by mail-ed1-f72.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso3187862edj.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 11:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AE8uUoA0RuM1LER5viKtBIKx5xuRVYpElfenEqY9TLo=;
 b=u5wjX/pL2w2cmeOD9B0f4NG0Gh9G14/DtSNeo+sLd2kfKnkRCt7WCAd/q/W6S3Pgxt
 qS2WTkc6Iod9mZjue2oXoY8op9sFaZBn8dpMtjWRgyEqVs0n2ODSKZVWLJk6zJEibjri
 B0Yia2XdUFmOC702k1xDf+uypB4pQy5dAlAp/dpV76IgDHiBDbHiROdiP4OsMW9lO+0D
 4btftOWb63oXG8+NzZkgKOaV9bhfv519TdYvhLQfu4zi3M3SdcHdTGM2mDTaS0WYQWeB
 u2WelOGEQMLX4nWI7uZ17e7n4DzzZzFzeOwajwCCShG3REsScJGGn764tx7DSBqljob0
 HcSA==
X-Gm-Message-State: AOAM532yaf6ESVyLeIw+CRqFUyne14WY7HfJ58WBV5GDPSBf+uIu/BbA
 MNQDkqG/SPyRZngKYQoWEuFhoda35WTZnJL0AdbYSAEJrfeK+0PBbtizzvfiF9rfwzgprIeZV1T
 FM5c5JhbnTfM9gR5EpP1rM8ia7Mgzi6hLgxtGe2zjHA==
X-Received: by 2002:a05:6402:10cd:: with SMTP id
 p13mr40854895edu.111.1635360320350; 
 Wed, 27 Oct 2021 11:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws8TIqKC4ABBb80IsEuESM2Uk5/cMArq6m4yV4675OMckUCxWdSKHAmukoJVCJYGUu14s3xw==
X-Received: by 2002:a05:6402:10cd:: with SMTP id
 p13mr40854878edu.111.1635360320163; 
 Wed, 27 Oct 2021 11:45:20 -0700 (PDT)
Received: from redhat.com ([2.55.137.59])
 by smtp.gmail.com with ESMTPSA id hc10sm359034ejc.93.2021.10.27.11.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:45:18 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:45:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: vDPA bus driver selection
Message-ID: <20211027144048-mutt-send-email-mst@kernel.org>
References: <CAGxU2F7r7=P8E-f1Nnm2h18S-hL8YBt7s=J81fkQcrAdpZ-KwQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F7r7=P8E-f1Nnm2h18S-hL8YBt7s=J81fkQcrAdpZ-KwQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eli Cohen <elic@nvidia.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>
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

On Wed, Oct 27, 2021 at 04:33:50PM +0200, Stefano Garzarella wrote:
> Hi folks,
> I was trying to understand if we have a way to specify which vDPA bus
> driver (e.g. vhost-vdpa, virtio-vdpa) a device should use.
> IIUC we don't have it, and the first registered driver is used when a
> new device is registered.
> 
> I was thinking if it makes sense to extend the management API to
> specify which bus driver to use for a device. A use case could be for
> example a single host handling VMs and bare-metal containers, so we
> would have both virtio-vdpa and vhost-vdpa loaded and we want to
> attach some devices to VMs through vhost-vdpa and others to containers
> through virtio-vdpa.
> 
> What do you think?
> 
> I can prepare an RFC with some code, the idea is to use the .match
> callback of "struct bus_type" to use a driver instead of the other,
> and extend netlink API to specify the vDPA bus driver name to use.
> 
> Thanks,
> Stefano

So I think that doing this at create time is somewhat limited.
For example a great way to do migration could be to unbind
device from VM then bind virtio on the host to it, then
bind macvtap to that.

Ideas on how to allow that?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
