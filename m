Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05615B317
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 22:50:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D302785EBB;
	Wed, 12 Feb 2020 21:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6e4--RRz1fr; Wed, 12 Feb 2020 21:50:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5DC5085EC1;
	Wed, 12 Feb 2020 21:50:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EF09C0177;
	Wed, 12 Feb 2020 21:50:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F08F4C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 21:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DF44F8538A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 21:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuzB_vFEuF4v
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 21:50:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4B48E85EC1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 21:50:08 +0000 (UTC)
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mna0x-1jjHCt09tl-00jdwv for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 22:50:06 +0100
Received: by mail-qv1-f42.google.com with SMTP id o18so1683983qvf.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:50:05 -0800 (PST)
X-Gm-Message-State: APjAAAVKTHnuyrl0IJTQ4RotmmLEWj4kdvKpSlsbG56QH40IpOKNjBKG
 C8lQTar3/Njm9FVUwlGfZymFBnsMHJ0ILCRT4RU=
X-Google-Smtp-Source: APXvYqy8/dUIT78ziPbi+m7w9c1it35QsSL0SZ9iXSbO5y/IXrIrtcYAZ9F8FLr3BxGmZME4ZZPNyKpXXH0FnHsB7eo=
X-Received: by 2002:a05:6214:524:: with SMTP id
 x4mr21607034qvw.4.1581544204910; 
 Wed, 12 Feb 2020 13:50:04 -0800 (PST)
MIME-Version: 1.0
References: <20200102145552.1853992-1-arnd@arndb.de>
 <20200102145552.1853992-14-arnd@arndb.de>
 <20200212211452.GA5726@latitude>
In-Reply-To: <20200212211452.GA5726@latitude>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 12 Feb 2020 22:49:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0oPpMC8367sEs+9Ae=wFH30BHAq+aRDbWLyeVLuNOnEw@mail.gmail.com>
Message-ID: <CAK8P3a0oPpMC8367sEs+9Ae=wFH30BHAq+aRDbWLyeVLuNOnEw@mail.gmail.com>
Subject: Re: [PATCH v3 13/22] compat_ioctl: scsi: move ioctl handling into
 drivers
To: Johannes Hirte <johannes.hirte@datenkhaos.de>
X-Provags-ID: V03:K1:dHeXq03esI88fgsl6u1x1EJrZ+Gt+fPr0uFJJRnNwusovRirEkC
 vvWb6YjuKL0N9ScS6zVqfyR/wg5+AG5vkCz7tkz7lfRKpYhIbKAqef+L0r19URu0ZqwMHbf
 GvGzQXIU74Tmjk25D8H3bi+f+FCf1Vm5TR2dvjpoe8qpb6R376QV05HPpqfVOXAalqzhaRy
 Sz8z4/pkpYYW82rF3VFWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:boyZ6nPhR+c=:cNW1rn8/+CgrfvvY46Lagb
 1PPJLOMt6Iv+lTiUhn5IO9LnzuiSD5ve2tyAvGccif+hx3PrM4ZnBpBiO3ahlCz1SC3AJuDa0
 VA22KFcmi5sWHgegWULD+QJ3Wv40y7+tNYIK0YyqPz8WDUGQh9zGHibhYAmAzREw55/8V7LG7
 39mx1wxLF1oP7hn7kgOyi02k3Ll95OvRAlaWw6OzXeES5sbpxVx7N2SeQOCCGuo/xmvVkGFvA
 I4YnsBuELAzqyTE0q3M59GX7ej5Sna7fSy8gqGPzAG1wluR4KkcQDegm6gqWUkpwerhGcIaRm
 QCPPaqkaKU0+JFQstRzV6N8aMQXH0LBvd6RpeHlsbrGLs9AhTymfYIdSbEnsyPc6z+5oSJjNF
 t0lC4JgdaVMbsZ0UR9CZsb8R+LpLo8n0W/9Vg1c4ywlD0vFBE5AP9OEzhGEmsBCnwVEOPU617
 dlrkhkHK2govE3HAWENMxXkrgY0Pe/HOXswEuwrahOA5IGIAd5G46UjC9ZUqDs1UEoVZSgCxo
 a21BktaW9/Pb0F2eG5LJ+3rklqQ1UnL4eKPBJKnrc36aQbCfA5Kq67ZSzsfAq5Agz2iXtGZvC
 LKfXWDNJg0wqhOPmRQv+SMBu7X1Df8kiS1DjxKtAxouDd3sUwX65cFgFKs1QtZoRxI94whNqk
 36sCZxgGzLFMwCOjkXSlRtOKV/aSst4nsliJ2yjCmCIvP2NxzxBmpi5aTzYpZoMq+hXpZaVuP
 Brewjz++sijiJQZHx/dhJo/cGEAdPAW7iazpyBvcbqQCAT73i6o4f/tgxSR82UIS6hJ3GPBoY
 zIC+A50AyAUqtHkfpqkQ2fiT5VgT2YfD41JYFgYa17pBmOPWzI=
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 =?UTF-8?Q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>,
 Ira Weiny <ira.weiny@intel.com>, Martin Wilck <mwilck@suse.com>,
 Hannes Reinecke <hare@suse.com>, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Doug Gilbert <dgilbert@interlog.com>, Iustin Pop <iustin@k1024.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, linux-block <linux-block@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
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

On Wed, Feb 12, 2020 at 10:15 PM Johannes Hirte
<johannes.hirte@datenkhaos.de> wrote:
>
> On 2020 Jan 02, Arnd Bergmann wrote:

>
> Error in getting drive hardware properties
> Error in getting drive reading properties
> Error in getting drive writing properties
> __________________________________
>
> Disc mode is listed as: CD-DA
> ++ WARN: error in ioctl CDROMREADTOCHDR: Bad address
>
> cd-info: Can't get first track number. I give up.

Right, there was also a report about breaking the Fedora installer,
see https://bugzilla.redhat.com/show_bug.cgi?id=1801353

There is a preliminary patch that should fix this, I'll post a
version with more references tomorrow:
https://www.happyassassin.net/temp/0001-Replace-.ioctl-with-.compat_ioctl-in-three-appropria.patch

      Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
