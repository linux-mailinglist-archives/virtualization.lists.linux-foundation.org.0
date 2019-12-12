Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3014811C8FA
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 10:18:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2591F881E9;
	Thu, 12 Dec 2019 09:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5j+TpKbMZZR; Thu, 12 Dec 2019 09:18:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 34457881D7;
	Thu, 12 Dec 2019 09:18:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BF77C0881;
	Thu, 12 Dec 2019 09:18:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17381C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 09:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0CD3C8484F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 09:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKCdi1I9p9P2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 09:18:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CEB11845D5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 09:18:03 +0000 (UTC)
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mduym-1i6onv1W4M-00b6r0 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 10:18:01 +0100
Received: by mail-qk1-f181.google.com with SMTP id l124so1016082qkf.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 01:18:01 -0800 (PST)
X-Gm-Message-State: APjAAAWPnJkTt/PzeasTQyQ8oe+VP3Nk8NCp0u2Ku9XvcbFL9vTJNoES
 j3Hv2t1/M2ctL+fDIBa6GAV4f1MnJeLWoEMbB7Q=
X-Google-Smtp-Source: APXvYqxQ00UNQvIg4lRrwqZ6prCq1ld+K+cVy4gCbiI7WVM1uWsZJdRSTMNOdaexs+HkrBjFyzUyLfqiJWBof8X+Tg8=
X-Received: by 2002:a37:5b45:: with SMTP id p66mr7106225qkb.394.1576142280134; 
 Thu, 12 Dec 2019 01:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20191211204306.1207817-1-arnd@arndb.de>
 <20191211204306.1207817-16-arnd@arndb.de>
 <20191211180155-mutt-send-email-mst@kernel.org>
 <858768fb-5f79-8259-eb6a-a26f18fb0e04@redhat.com>
In-Reply-To: <858768fb-5f79-8259-eb6a-a26f18fb0e04@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 12 Dec 2019 10:17:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hxD9aaabf2sK3ozqVdr2pbDS10W+Z6oT4idk=AitwVQ@mail.gmail.com>
Message-ID: <CAK8P3a2hxD9aaabf2sK3ozqVdr2pbDS10W+Z6oT4idk=AitwVQ@mail.gmail.com>
Subject: Re: [PATCH 15/24] compat_ioctl: scsi: move ioctl handling into drivers
To: Paolo Bonzini <pbonzini@redhat.com>
X-Provags-ID: V03:K1:ER0yaeqfbAgtTTFSL5V2ZPQqewDGDhprYw6ThaY0sLa3sYdqsGw
 nW67yWIrBanupQRg9JluK63gcSsYUOc2GkeIZjxrLFLA9jQMsotsSRj4D7tRMoB+VngpIuq
 8BhwNekK8/NxnQAN4zE/E28/uMvf6KQo+DHkjDkwwr3XZeAOJIlGxu8DxIEvTdhCIWCPeuO
 EZBUg5/E2dQz+ywd1l7cA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ETttnxDZuNQ=:YCTtk209TW/8/EypYgMbPo
 I/vDa5AFe+7ZpkXR+nnOs4u0Gl8FqoXLoau6sOrQmv4b2RHBkSR5Yzm6/IQ3SXXB+gQBCuZrn
 cZuatL3vVq1YI0N6q2NcSGICkEkdfrAKMW5vmmleeDAy13ykul1qy/eC2L0N1Xul35EXd5f3Q
 bg4c0dcDa/QWQ4pFfn+mSDqDD/cnRXg7MFwXoMgs4lyeySurcZVQmzspkriPsqiqdsj0fa6yN
 niNfIrVlK2yEQt+rVAPzS2ojK0WDYydCrYGDz5NB+EGiIriMmCyF6UKrbmkKbqqaTKlJxstbj
 GH9twGwZF77852iE3uAV3bE3TpXmIVDUNZOm3sGA51y4VT+dZ9r4RlqlBC2OGRDfGStk2AZID
 utx27Q0ogc5ja/TOr1lCfLDVVYfmm73vfvw0LPpvm2+5UEbIC23tGD+K6PVu2dLDs5CYkKOTs
 mL/ZRtBxkFUv8jJ1CrJAAFYsZctbFh+6IyWxabSzO3R24jibLxLWd4yoXSi7T7bFqhcAZ9hVk
 PiJO6lCAPNl3fhb6+CvVpUxc2kaENuHpcEk/OlLqEs6L9eudQYv6N7GZnUDqw6n/qpUq/S0Cs
 EQ1Z+QTNv8+cUJLoWV/zFf7CIU9fyNO73FLlBSZPI48tu/U1n+9gSYbgYPBtJecPzNh2Op7Fo
 PwqLIzVSDyZJd6x1Su2y1ao+xZJFdjPhHsqowx589Pn2/3eVo8whqyUL6aM50y+feauQMMihG
 jK4eX/3F9iCKz5gLeoHxb3b1yrU+nM7PWJlWOJwjPP/HjjI8ZCDPx4QtX6DxfkTz0vYBCIWs3
 Zo/B6cHP6UxEETCQrP9M1fMRBSdrEcIXTp82EqREUbp33NKMwBwBwGonRLo62Fkcg70qFclB5
 Go/ERqxRObsE/X1qyGwA==
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
 Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 John Garry <john.garry@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>,
 linux-block <linux-block@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Doug Gilbert <dgilbert@interlog.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 linux-scsi <linux-scsi@vger.kernel.org>
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

On Thu, Dec 12, 2019 at 1:28 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 12/12/19 00:05, Michael S. Tsirkin wrote:
> >> @@ -405,6 +405,9 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
> >>
> >>  static const struct block_device_operations virtblk_fops = {
> >>      .ioctl  = virtblk_ioctl,
> >> +#ifdef CONFIG_COMPAT
> >> +    .compat_ioctl = blkdev_compat_ptr_ioctl,
> >> +#endif
> >>      .owner  = THIS_MODULE,
> >>      .getgeo = virtblk_getgeo,
> >>  };
> > Hmm - is virtio blk lumped in with scsi things intentionally?
>
> I think it's because the only ioctl for virtio-blk is SG_IO.  It makes
> sense to lump it in with scsi, but I wouldn't mind getting rid of
> CONFIG_VIRTIO_BLK_SCSI altogether.

It currently calls scsi_cmd_blk_ioctl(), which implements a bunch of ioctl
commands, including some that are unrelated to SG_IO:

                case SG_GET_VERSION_NUM:
                case SCSI_IOCTL_GET_IDLUN:
                case SCSI_IOCTL_GET_BUS_NUMBER:
                case SG_SET_TIMEOUT:
                case SG_GET_TIMEOUT:
                case SG_GET_RESERVED_SIZE:
                case SG_SET_RESERVED_SIZE:
                case SG_EMULATED_HOST:
                case SG_IO: {
                case CDROM_SEND_PACKET:
                case SCSI_IOCTL_SEND_COMMAND:
                case CDROMCLOSETRAY:
                case CDROMEJECT:

My patch changes all callers of this function, and the idea is
to preserve the existing behavior through my series, so I think
it makes sense to keep my patch as is.

I would assume that calling scsi_cmd_blk_ioctl() is harmless
here, but if you want to remove it or limit the set of supported
commands, that should be independent of my change.

       Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
