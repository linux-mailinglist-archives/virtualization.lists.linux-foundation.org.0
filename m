Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC61118AF7
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 15:33:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E879585078;
	Tue, 10 Dec 2019 14:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ctchakMvqhR; Tue, 10 Dec 2019 14:33:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 149C484FC9;
	Tue, 10 Dec 2019 14:33:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9198C1D83;
	Tue, 10 Dec 2019 14:33:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B5E8C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 478A587B62
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39+oU4t0ETSU
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:32:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A813A87B5D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575988378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oltekNksYL0JppEwk+sb0PIOexNRJT7sk8bU9jqVsg4=;
 b=hvsxfjmMoitupznPbVPVO//BXYXSHKyMsIxtCys1WOlZ2B9L70Y6M2zw8DPC/vpRluwlC2
 rz3q65bzM6vutyLKPIWTpOSJuqm3nttyKJgSZ/skpj4C9DEP8q5SOK3boV+BQqOWv5hNaQ
 m2j76VCWYKO5z8avRj49Cq0iK1hMTo0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-sR0gGo4VOOi0ta8FUUXk2A-1; Tue, 10 Dec 2019 09:32:55 -0500
Received: by mail-wr1-f72.google.com with SMTP id v17so8995969wrm.17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 06:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZX5clcawRs9HvyErreGyUr6byz6y4hiLe4x5yy5XB+w=;
 b=eVDoo0C5yduPn31Hp+EdMb9OIMKpByRJ9qU6hlKsMH90Snp3EBmkbIwRlOpOuX+LmV
 T+j78iw2Dk5O5V+rsQe1KgRdnAyDG0mYsNEV3YoDeITNn72WjEuKz3btN600wn7dog7n
 cLO8z6B4wIobY/CFj3rz6JoIXIF5GOkisLTM9Yh3ZfRg4vg/xnAvdrZdsuKJYlkSF9n/
 sxOqkjXGID1x0sYt7Z7Y3mUH4Gh3KDoRRaYiNtsNiPigQpyDkzylyU/+qKu3q+hxtHis
 9CbIQIuhHHJDXR5sgC0DdJdeMIN9ClhW/A3bbHocjaZ+22+mVC9WJtTw75+lk7ft2iLV
 lA0Q==
X-Gm-Message-State: APjAAAX10WK38173HGHX7xJ4vCML8TWY+iL6VepARMzydnfHs4i2rQxm
 fbl6dsw8PINnMY/LPDp6iZVqBTCs1iTt+dmoisbOMFqReiHfcELNH8AXXKlaWDTS1kL84FDik/n
 pb/eLZBnYt0JsRdJeZb6jYYaCDsiK4FeWAyXpLJeq+A==
X-Received: by 2002:a05:600c:2947:: with SMTP id
 n7mr5228100wmd.156.1575988374114; 
 Tue, 10 Dec 2019 06:32:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5osq8iXaghf+DSPEJ+fI9zhfAtq/jAq/Ozou/cbeXTMCvexsR8V2x1X6t2Pp1+8eyRY0ljg==
X-Received: by 2002:a05:600c:2947:: with SMTP id
 n7mr5228075wmd.156.1575988373894; 
 Tue, 10 Dec 2019 06:32:53 -0800 (PST)
Received: from steredhat ([95.235.120.92])
 by smtp.gmail.com with ESMTPSA id b185sm3483015wme.36.2019.12.10.06.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 06:32:53 -0800 (PST)
Date: Tue, 10 Dec 2019 15:32:51 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost/vsock: accept only packets with the right dst_cid
Message-ID: <20191210143251.szkicty23b6pojxh@steredhat>
References: <20191206143912.153583-1-sgarzare@redhat.com>
 <20191210090505-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191210090505-mutt-send-email-mst@kernel.org>
X-MC-Unique: sR0gGo4VOOi0ta8FUUXk2A-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On Tue, Dec 10, 2019 at 09:05:58AM -0500, Michael S. Tsirkin wrote:
> On Fri, Dec 06, 2019 at 03:39:12PM +0100, Stefano Garzarella wrote:
> > When we receive a new packet from the guest, we check if the
> > src_cid is correct, but we forgot to check the dst_cid.
> > 
> > The host should accept only packets where dst_cid is
> > equal to the host CID.
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> what's the implication of processing incorrect dst cid?
> I think mostly it's malformed guests, right?

Exaclty, as for the src_cid.

In both cases the packet may be delivered to the wrong socket in the
host, because in the virtio_transport_recv_pkt() we are using the
src_cid and dst_cid to look for the socket where to queue the packet.

> Everyone else just passes the known host cid ...

Yes, good guests should do it, and we do it :-)

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
