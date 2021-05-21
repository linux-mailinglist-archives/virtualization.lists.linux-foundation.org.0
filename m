Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB6E38C21C
	for <lists.virtualization@lfdr.de>; Fri, 21 May 2021 10:39:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0745D400CA;
	Fri, 21 May 2021 08:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwI19FSkgN-Z; Fri, 21 May 2021 08:39:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id E915E404D4;
	Fri, 21 May 2021 08:39:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72130C0001;
	Fri, 21 May 2021 08:39:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6F8FC0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E32A783D23
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iz-iXVu8mJDc
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:39:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C85083CFE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:39:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-2qxIbDPeMrixVUQP_btX0g-1; Fri, 21 May 2021 04:39:31 -0400
X-MC-Unique: 2qxIbDPeMrixVUQP_btX0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87F65106BB24;
 Fri, 21 May 2021 08:39:30 +0000 (UTC)
Received: from bahia.lan (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 665FA10013D6;
 Fri, 21 May 2021 08:39:22 +0000 (UTC)
Date: Fri, 21 May 2021 10:39:21 +0200
From: Greg Kurz <groug@kaod.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH v4 4/5] virtiofs: Skip submounts in sget_fc()
Message-ID: <20210521103921.153a243d@bahia.lan>
In-Reply-To: <CAJfpegugQM-ChaGiLyfPkbFr9c=_BiOBQkJTeEz5yN0ujO_O4A@mail.gmail.com>
References: <20210520154654.1791183-1-groug@kaod.org>
 <20210520154654.1791183-5-groug@kaod.org>
 <CAJfpegugQM-ChaGiLyfPkbFr9c=_BiOBQkJTeEz5yN0ujO_O4A@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Cc: linux-kernel@vger.kernel.org, Max Reitz <mreitz@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Vivek Goyal <vgoyal@redhat.com>
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

On Fri, 21 May 2021 10:26:27 +0200
Miklos Szeredi <miklos@szeredi.hu> wrote:

> On Thu, 20 May 2021 at 17:47, Greg Kurz <groug@kaod.org> wrote:
> >
> > All submounts share the same virtio-fs device instance as the root
> > mount. If the same virtiofs filesystem is mounted again, sget_fc()
> > is likely to pick up any of these submounts and reuse it instead of
> > the root mount.
> >
> > On the server side:
> >
> > # mkdir ${some_dir}
> > # mkdir ${some_dir}/mnt1
> > # mount -t tmpfs none ${some_dir}/mnt1
> > # touch ${some_dir}/mnt1/THIS_IS_MNT1
> > # mkdir ${some_dir}/mnt2
> > # mount -t tmpfs none ${some_dir}/mnt2
> > # touch ${some_dir}/mnt2/THIS_IS_MNT2
> >
> > On the client side:
> >
> > # mkdir /mnt/virtiofs1
> > # mount -t virtiofs myfs /mnt/virtiofs1
> > # ls /mnt/virtiofs1
> > mnt1 mnt2
> > # grep virtiofs /proc/mounts
> > myfs /mnt/virtiofs1 virtiofs rw,seclabel,relatime 0 0
> > none on /mnt/mnt1 type virtiofs (rw,relatime,seclabel)
> > none on /mnt/mnt2 type virtiofs (rw,relatime,seclabel)
> >
> > And now remount it again:
> >
> > # mount -t virtiofs myfs /mnt/virtiofs2
> > # grep virtiofs /proc/mounts
> > myfs /mnt/virtiofs1 virtiofs rw,seclabel,relatime 0 0
> > none on /mnt/mnt1 type virtiofs (rw,relatime,seclabel)
> > none on /mnt/mnt2 type virtiofs (rw,relatime,seclabel)
> > myfs /mnt/virtiofs2 virtiofs rw,seclabel,relatime 0 0
> > # ls /mnt/virtiofs2
> > THIS_IS_MNT2
> >
> > Submount mnt2 was picked-up instead of the root mount.
> 

> Why is this a problem?
> 

It seems very weird to mount the same filesystem again
and to end up in one of its submounts. We should have:

# ls /mnt/virtiofs2
mnt1 mnt2

> Thanks,
> Miklos

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
