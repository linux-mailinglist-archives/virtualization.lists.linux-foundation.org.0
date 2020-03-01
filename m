Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0446B174D68
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 13:59:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0325820366;
	Sun,  1 Mar 2020 12:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6H5kdKjB7vD; Sun,  1 Mar 2020 12:59:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3496020358;
	Sun,  1 Mar 2020 12:59:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C715C013E;
	Sun,  1 Mar 2020 12:59:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE7B4C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 12:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A9B8886091
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 12:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0hQ-nFXG74Q
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 12:58:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ECD0586072
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583067537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=57xE3FiPLk4S1t9miz6Kb+kV2j+1x1OuYAKKZJL7Z6w=;
 b=SCrhk0PLiRtkt0DytoJ96LvgorapvUKEcJl5MViabSKitxuT8A+FuX962KVXP7UDR3a9dF
 ZUxYnXGGqTpkavb6S6RbGe/X1CwFaD2aAoFqpNW55q1/IPHFQN8qu0wjNCz2VMXgLnrZPy
 eUl4mq55BSN5kskuSEiZituu7dQhtoQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-RsFdd7dONx-MN8B-EyADow-1; Sun, 01 Mar 2020 07:58:56 -0500
X-MC-Unique: RsFdd7dONx-MN8B-EyADow-1
Received: by mail-qv1-f69.google.com with SMTP id l7so4758130qvt.22
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 04:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=57xE3FiPLk4S1t9miz6Kb+kV2j+1x1OuYAKKZJL7Z6w=;
 b=pNWMA7YkcXGOhNLvwuCKkkQNYA07Fp8BapOX1CDNUqpvTF/9MrjMjx/rbZobAkIHut
 ywai4c4gSlYeGEhGi9aT/e8qm0/3aGpdf0tbAeKyhb+4FDD5gJDNktzpVp9X+wSL6lPb
 DrMlsghE5OoMiUqT/QAqJ8NnTuq3ByWq5MVQxP4HMKSGHdHAwbktW/wDWO+Gx3E3MJE1
 FCRXgH0SeAqpXrfp3P6LAIXDcxsLJAVlYOKFKrucKiNDvo+UPJwE5ixvE6fsrlvD8Zqs
 xmp5Me3+7oVJwpAerxBjPQgUKXrJey1kVv9HVTGuC1sD8ZNGKYEZxTanrsDHUZCYtk5k
 OfNg==
X-Gm-Message-State: APjAAAWw/Vq9Wb3Bjcu2r6XFU5tIFvlAAR1RcBlOp49H2zy6nIL9JtZP
 q+W80QrOmeo2MZhnJPYoyvxzMpbpTmAXoHo/we0p4O/Y4LzBFyRY3W3kSF350rD5bGdB+6x25gU
 fWtt/rSRi+a9Alt5+fNR5zbHdrj6uPGDvPl45RAgCAQ==
X-Received: by 2002:ad4:58ef:: with SMTP id
 di15mr11112957qvb.123.1583067535686; 
 Sun, 01 Mar 2020 04:58:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfIN9Zu+nhqb4qUcHxjw5mMZnySUcj7h4+knDgayg/5ujQbsXiB6k/JWOJ8enZlXCiJm38GQ==
X-Received: by 2002:ad4:58ef:: with SMTP id
 di15mr11112943qvb.123.1583067535472; 
 Sun, 01 Mar 2020 04:58:55 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id d35sm6821648qtc.21.2020.03.01.04.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 04:58:54 -0800 (PST)
Date: Sun, 1 Mar 2020 07:58:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v2 0/3] virtio-net: introduce features defined in the spec
Message-ID: <20200301075729-mutt-send-email-mst@kernel.org>
References: <20200301110733.20197-1-yuri.benditovich@daynix.com>
 <20200301063121-mutt-send-email-mst@kernel.org>
 <CAOEp5Ofzz2CrkbBoPsOAGDVdVJZ07nzH0Usv5h6a96p8+YknwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOEp5Ofzz2CrkbBoPsOAGDVdVJZ07nzH0Usv5h6a96p8+YknwA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Yan Vugenfirer <yan@daynix.com>, linux-kernel@vger.kernel.org,
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

On Sun, Mar 01, 2020 at 02:47:41PM +0200, Yuri Benditovich wrote:
> On Sun, Mar 1, 2020 at 1:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Mar 01, 2020 at 01:07:30PM +0200, Yuri Benditovich wrote:
> > > This series introduce virtio-net features VIRTIO_NET_F_RSC_EXT,
> > > VIRTIO_NET_F_RSS and VIRTIO_NET_F_HASH_REPORT.
> > >
> > > Changes from v1:
> > > __virtio -> __le
> > > maximal -> maximum
> > > minor style fixes
> >
> >
> > Looks good to me - sent a bit of consmetics.
> >
> > But as any virtio UAPI change, please CC virtio-dev as virtio TC maintains the
> > interface. Thanks!
> 
> Probably 'virtio-dev' should be added to maintainers file.

Doesn't work because it's a subscriber only list.
I've been asking to fix that for years ...

> >
> > > Yuri Benditovich (3):
> > >   virtio-net: Introduce extended RSC feature
> > >   virtio-net: Introduce RSS receive steering feature
> > >   virtio-net: Introduce hash report feature
> > >
> > >  include/uapi/linux/virtio_net.h | 90 +++++++++++++++++++++++++++++++--
> > >  1 file changed, 86 insertions(+), 4 deletions(-)
> > >
> > > --
> > > 2.17.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
