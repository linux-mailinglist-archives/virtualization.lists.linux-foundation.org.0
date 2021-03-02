Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660B329B20
	for <lists.virtualization@lfdr.de>; Tue,  2 Mar 2021 11:54:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37B94EC77;
	Tue,  2 Mar 2021 10:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sNHs9t2Xr-l; Tue,  2 Mar 2021 10:54:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A8104EC9A;
	Tue,  2 Mar 2021 10:54:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDD83C0001;
	Tue,  2 Mar 2021 10:54:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E4CCC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 10:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F15566F593
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 10:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gq6ntfmZA8uY
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 10:54:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6191D6F4D4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 10:54:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQMi7-1lUZAo1oAb-00MNuz for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Mar 2021 11:54:19 +0100
Received: by mail-wm1-f53.google.com with SMTP id m1so2215175wml.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Mar 2021 02:54:19 -0800 (PST)
X-Gm-Message-State: AOAM533ArRLmyRO7iXSscSTRjbUfczZggj0B9udyVhR17VM0e18IFepw
 8+QwcWsrzZzfDRcutguPSogkZwc8JUnRtmPTugQ=
X-Google-Smtp-Source: ABdhPJwSy1Zm9Mymlo1hNSTEvNea2JqPihM0NDsdqQ4z0ab+tRCjmNhlJs5SPzaIvZ02aT2eYQCACTgNAzu/Id76t/U=
X-Received: by 2002:a05:600c:4f11:: with SMTP id
 l17mr3405660wmq.38.1614682458937; 
 Tue, 02 Mar 2021 02:54:18 -0800 (PST)
MIME-Version: 1.0
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <CAK8P3a1ZXbodV07TTErnQunCLWOBnzRiVdLCxBD743fn-6FbXg@mail.gmail.com>
 <56fdef9a-b373-32f2-6dac-e687caa813c8@intel.com>
 <YD4KovxeoNG/c8QC@stefanha-x1.localdomain>
In-Reply-To: <YD4KovxeoNG/c8QC@stefanha-x1.localdomain>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 2 Mar 2021 11:54:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a23L-Y0vzJTb5w1MkumaYAJQ6Owiq6RZ2XE=i8gBMTUZw@mail.gmail.com>
Message-ID: <CAK8P3a23L-Y0vzJTb5w1MkumaYAJQ6Owiq6RZ2XE=i8gBMTUZw@mail.gmail.com>
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Provags-ID: V03:K1:StZ8ZtJoFZvg6fmEWXSX0KYf8cIhKsBX3t4Iyz7D+iVy26YvGuw
 XwMNzSOMq8s+U40lq4ckhj+K88gOelkOhXlp1qM0REHc/LCLolEzOK/tr8czIC8pvwiFcMX
 tjg0V7TiTzPqy1rX3A4p9xH7LcIW+yV1Ul/OkxRZasviQ5fC92sQ3u0cXp2Y6fZIlM6nzAe
 PZq3gynUnhWLco4wRD1KQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iM/hkYZ/M9Q=:GTDWlsAgPRmtJfO+2Goxt6
 8O1qxXlfiRhCkxZkVSBuvMZQIK+asMs4XApKRBoEcI/51ffJIfB8C5QQKGKa1nGE7HfvC0Whi
 O7ww9lPtRFzCo91G/XUkSebe5YC6GNMJi3pLEAZfT2SiouuKCeC2vfEKwRQ6E73kOmSKf52jn
 EqzIxI+nFCcLLBZsD2Z3z8sVqKUBmyNd6kYhBcE7XWHJNEkVoTk0lA0BD0kbsu1MDSQ3wRtww
 Bun1Fnqs3u4etIGZ2kVEC4KTMp1gHC1oaEi6EPkb1uAi0+/tTEe1D34mBXu7gOCQHrMZykSR+
 f9GQoP3ga4+Bi9rh0hZ3HjdvKrDD6S33oAOHi02pVnUhcILSAO6SMe0lMTx4wL47o3tST6Ojp
 ows2vT5KxQW5f6eThArNf0Ge16dgj2UMvGsmo9bTTxNJOneeIcZye6bkT83VFPYe4qti/wEru
 9OAR2rSCBNigpXRbvWDwH0G1Q+8kaY34ikTfYULpMFMmXwwIrD4yoLK4YJmRbXNbsMYRlfefs
 QhoCqGMVhtpDbEA17WUotBIYXdERs6rf1DgL+NoOjoXA48MK9E8RZG3WqN6fjM6+w==
Cc: Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, loic.poulain@linaro.org,
 Tali Perry <tali.perry1@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, shuo.a.liu@intel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, jarkko.nikula@linux.intel.com,
 Linux I2C <linux-i2c@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 kblaiech@mellanox.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 conghui.chen@intel.com, Mike Rapoport <rppt@kernel.org>, yu1.wang@intel.com
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

On Tue, Mar 2, 2021 at 10:51 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> On Tue, Mar 02, 2021 at 10:42:06AM +0800, Jie Deng wrote:
> > > > +/*
> > > > + * Definitions for virtio I2C Adpter
> > > > + *
> > > > + * Copyright (c) 2021 Intel Corporation. All rights reserved.
> > > > + */
> > > > +
> > > > +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
> > > > +#define _UAPI_LINUX_VIRTIO_I2C_H
> > > Why is this a uapi header? Can't this all be moved into the driver
> > > itself?
>
> Linux VIRTIO drivers provide a uapi header with structs and constants
> that describe the device interface. This allows other software like
> QEMU, other operating systems, etc to reuse these headers instead of
> redefining everything.
>
> These files should contain:
> 1. Device-specific feature bits (VIRTIO_<device>_F_<feature>)
> 2. VIRTIO Configuration Space layout (struct virtio_<device>_config)
> 3. Virtqueue request layout (struct virtio_<device>_<req/resp>)
>
> For examples, see <linux/virtio_net.h> and <linux/virtio_blk.h>.

Ok, makes sense. So it's not strictly uapi but just helpful for
virtio applications to reference these. I suppose it is slightly harder
when building qemu on other operating systems though, how does
it get these headers on BSD or Windows?

       Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
