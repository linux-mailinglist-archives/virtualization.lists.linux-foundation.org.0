Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 178AA225DB2
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 13:46:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9DEB220528;
	Mon, 20 Jul 2020 11:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sY-FSSjevIgl; Mon, 20 Jul 2020 11:46:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3EFB820445;
	Mon, 20 Jul 2020 11:46:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EFF4C016F;
	Mon, 20 Jul 2020 11:46:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01E0CC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 11:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DBD2687C16
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 11:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9qVChikfbXCb
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 11:45:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 69EC187B96
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595245557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZR0exc4XAuVT7yjAHBAMaWNB7pi4zW8WMPFSOtIO2w=;
 b=YFqCwbSQs3LPrhUePnogGTwy8ARR/AxzDFs1+Px/9MMrqZ1I80PdQQfGxdLyjtbfETkQAS
 jj2kqVyk+94hH+BtxWy10f9Pa5WLVGfZ2wwxF1yjh/Fc3vrstJZHNt7fY30GVUBnS1FU9A
 tjg+lJ2qZZ1kxH8JtT1TGyi4YcAWnB0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-s-rk4FuxM_SM6VuoA5niZA-1; Mon, 20 Jul 2020 07:45:55 -0400
X-MC-Unique: s-rk4FuxM_SM6VuoA5niZA-1
Received: by mail-wm1-f71.google.com with SMTP id w25so10375140wmc.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xVTtZN1yW6PDq/VCwi0KTUBcBexhd/cNJy1JNokh2V4=;
 b=VvCAliZjiarcTbOXfoTZ5eagBmVcrIE5xO2F66ETkSKNZifZmzN/IRvnnNAk+6XNGD
 lkeHev+AYDo/fKMwuEqzVO7lOqL5dUQzNX8FaQcylLevUWYXNnCDbbb/LidofL6X+Agv
 XKPwSdKk8lTx7HMiH29hjhYY3bZ/LEcySSeLnn+F8aOtsiWkr6ByxiU+U3Pl6BLMpES/
 AAipZoamZ3bOTBl/1GNhtZnUT8NaB7MDc7bXLtMTYvHSSwst1qNwY9ej1UAlMDMsddn8
 0/toSxLUACHQbJOZAxN9xKQ4iffpVlPxZsZKHhFbfyoJ69/TW/L8LusR8U6LeniOYAqt
 muUw==
X-Gm-Message-State: AOAM5327fH2IU7Esl03yT59mGeaflT2WThWXXsPh47MZjUWHlFRen47i
 P5O280DXIE4S+qH4b/RGZur6Du20Wxj9rBaGb0ZDheesRfPELvv9CJuzq/NIP20CokykNVj2Qfc
 Sx8dMpKzfjX+iMq7MNpzgAt72zdJI13AcgDP5CRzrwQ==
X-Received: by 2002:adf:ff8c:: with SMTP id j12mr21608420wrr.230.1595245554054; 
 Mon, 20 Jul 2020 04:45:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywUX7LcIswRfFXg4IKadDwW85Nm02WIeN/kLTe6nu60lfJo1MyfmNao5wM684NFhYV4mfY2Q==
X-Received: by 2002:adf:ff8c:: with SMTP id j12mr21608404wrr.230.1595245553799; 
 Mon, 20 Jul 2020 04:45:53 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id o205sm33683152wme.24.2020.07.20.04.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 04:45:52 -0700 (PDT)
Date: Mon, 20 Jul 2020 07:45:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200720074545-mutt-send-email-mst@kernel.org>
References: <CAJaqyWedEg9TBkH1MxGP1AecYHD-e-=ugJ6XUN+CWb=rQGf49g@mail.gmail.com>
 <0a83aa03-8e3c-1271-82f5-4c07931edea3@redhat.com>
 <CAJaqyWeqF-KjFnXDWXJ2M3Hw3eQeCEE2-7p1KMLmMetMTm22DQ@mail.gmail.com>
 <20200709133438-mutt-send-email-mst@kernel.org>
 <7dec8cc2-152c-83f4-aa45-8ef9c6aca56d@redhat.com>
 <CAJaqyWdLOH2EceTUduKYXCQUUNo1XQ1tLgjYHTBGhtdhBPHn_Q@mail.gmail.com>
 <20200710015615-mutt-send-email-mst@kernel.org>
 <CAJaqyWf1skGxrjuT9GLr6dtgd-433y-rCkbtStLHaAs2W2jYXA@mail.gmail.com>
 <20200720051410-mutt-send-email-mst@kernel.org>
 <d4e29f0451f7551ee3a408ecfa40de2de2b8aa75.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d4e29f0451f7551ee3a408ecfa40de2de2b8aa75.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm list <kvm@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, Jul 20, 2020 at 01:16:47PM +0200, Eugenio P=C3=A9rez wrote:
> =

> On Mon, Jul 20, 2020 at 11:27 AM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> > On Thu, Jul 16, 2020 at 07:16:27PM +0200, Eugenio Perez Martin wrote:
> > > On Fri, Jul 10, 2020 at 7:58 AM Michael S. Tsirkin <mst@redhat.com> w=
rote:
> > > > On Fri, Jul 10, 2020 at 07:39:26AM +0200, Eugenio Perez Martin wrot=
e:
> > > > > > > How about playing with the batch size? Make it a mod paramete=
r instead
> > > > > > > of the hard coded 64, and measure for all values 1 to 64 ...
> > > > > > =

> > > > > > Right, according to the test result, 64 seems to be too aggress=
ive in
> > > > > > the case of TX.
> > > > > > =

> > > > > =

> > > > > Got it, thanks both!
> > > > =

> > > > In particular I wonder whether with batch size 1
> > > > we get same performance as without batching
> > > > (would indicate 64 is too aggressive)
> > > > or not (would indicate one of the code changes
> > > > affects performance in an unexpected way).
> > > > =

> > > > --
> > > > MST
> > > > =

> > > =

> > > Hi!
> > > =

> > > Varying batch_size as drivers/vhost/net.c:VHOST_NET_BATCH,
> > =

> > sorry this is not what I meant.
> > =

> > I mean something like this:
> > =

> > =

> > diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> > index 0b509be8d7b1..b94680e5721d 100644
> > --- a/drivers/vhost/net.c
> > +++ b/drivers/vhost/net.c
> > @@ -1279,6 +1279,10 @@ static void handle_rx_net(struct vhost_work *wor=
k)
> >         handle_rx(net);
> >  }
> > =

> > +MODULE_PARM_DESC(batch_num, "Number of batched descriptors. (offset fr=
om 64)");
> > +module_param(batch_num, int, 0644);
> > +static int batch_num =3D 0;
> > +
> >  static int vhost_net_open(struct inode *inode, struct file *f)
> >  {
> >         struct vhost_net *n;
> > @@ -1333,7 +1337,7 @@ static int vhost_net_open(struct inode *inode, st=
ruct file *f)
> >                 vhost_net_buf_init(&n->vqs[i].rxq);
> >         }
> >         vhost_dev_init(dev, vqs, VHOST_NET_VQ_MAX,
> > -                      UIO_MAXIOV + VHOST_NET_BATCH,
> > +                      UIO_MAXIOV + VHOST_NET_BATCH + batch_num,
> >                        VHOST_NET_PKT_WEIGHT, VHOST_NET_WEIGHT, true,
> >                        NULL);
> > =

> > =

> > then you can try tweaking batching and playing with mod parameter witho=
ut
> > recompiling.
> > =

> > =

> > VHOST_NET_BATCH affects lots of other things.
> > =

> =

> Ok, got it. Since they were aligned from the start, I thought it was a go=
od idea to maintain them in-sync.
> =

> > > and testing
> > > the pps as previous mail says. This means that we have either only
> > > vhost_net batching (in base testing, like previously to apply this
> > > patch) or both batching sizes the same.
> > > =

> > > I've checked that vhost process (and pktgen) goes 100% cpu also.
> > > =

> > > For tx: Batching decrements always the performance, in all cases. Not
> > > sure why bufapi made things better the last time.
> > > =

> > > Batching makes improvements until 64 bufs, I see increments of pps bu=
t like 1%.
> > > =

> > > For rx: Batching always improves performance. It seems that if we
> > > batch little, bufapi decreases performance, but beyond 64, bufapi is
> > > much better. The bufapi version keeps improving until I set a batching
> > > of 1024. So I guess it is super good to have a bunch of buffers to
> > > receive.
> > > =

> > > Since with this test I cannot disable event_idx or things like that,
> > > what would be the next step for testing?
> > > =

> > > Thanks!
> > > =

> > > --
> > > Results:
> > > # Buf size: 1,16,32,64,128,256,512
> > > =

> > > # Tx
> > > # =3D=3D=3D
> > > # Base
> > > 2293304.308,3396057.769,3540860.615,3636056.077,3332950.846,3694276.1=
54,3689820
> > > # Batch
> > > 2286723.857,3307191.643,3400346.571,3452527.786,3460766.857,3431042.5=
,3440722.286
> > > # Batch + Bufapi
> > > 2257970.769,3151268.385,3260150.538,3379383.846,3424028.846,3433384.3=
08,3385635.231,3406554.538
> > > =

> > > # Rx
> > > # =3D=3D
> > > # pktgen results (pps)
> > > 1223275,1668868,1728794,1769261,1808574,1837252,1846436
> > > 1456924,1797901,1831234,1868746,1877508,1931598,1936402
> > > 1368923,1719716,1794373,1865170,1884803,1916021,1975160
> > > =

> > > # Testpmd pps results
> > > 1222698.143,1670604,1731040.6,1769218,1811206,1839308.75,1848478.75
> > > 1450140.5,1799985.75,1834089.75,1871290,1880005.5,1934147.25,1939034
> > > 1370621,1721858,1796287.75,1866618.5,1885466.5,1918670.75,1976173.5,1=
988760.75,1978316
> > > =

> > > pktgen was run again for rx with 1024 and 2048 buf size, giving
> > > 1988760.75 and 1978316 pps. Testpmd goes the same way.
> > =

> > Don't really understand what does this data mean.
> > Which number of descs is batched for each run?
> > =

> =

> Sorry, I should have explained better. I will expand here, but feel free =
to skip it since we are going to discard the
> data anyway. Or to propose a better way to tell them.
> =

> Is a CSV with the values I've obtained, in pps, from pktgen and testpmd. =
This way is easy to plot them.
> =

> Maybe is easier as tables, if mail readers/gmail does not misalign them.
> =

> > > # Tx
> > > # =3D=3D=3D
> =

> Base: With the previous code, not integrating any patch. testpmd is txonl=
y mode, tap interface is XDP_DROP everything.
> We vary VHOST_NET_BATCH (1, 16, 32, ...). As Jason put in a previous mail:
> =

> TX: testpmd(txonly) -> virtio-user -> vhost_net -> XDP_DROP on TAP
> =

> =

>      1     |     16     |     32     |     64     |     128    |    256  =
   |   512  |
> 2293304.308| 3396057.769| 3540860.615| 3636056.077| 3332950.846| 3694276.=
154| 3689820|
> =

> If we add the batching part of the series, but not the bufapi:
> =

>       1     |     16     |     32     |     64     |     128    |    256 =
   |     512    |
> 2286723.857 | 3307191.643| 3400346.571| 3452527.786| 3460766.857| 3431042=
.5 | 3440722.286|
> =

> And if we add the bufapi part, i.e., all the series:
> =

>       1    |     16     |     32     |     64     |     128    |     256 =
   |     512    |    1024
> 2257970.769| 3151268.385| 3260150.538| 3379383.846| 3424028.846| 3433384.=
308| 3385635.231| 3406554.538
> =

> For easier treatment, all in the same table:
> =

>      1      |     16      |     32      |      64     |     128     |    =
256      |   512      |    1024
> ------------+-------------+-------------+-------------+-------------+----=
---------+------------+------------
> 2293304.308 | 3396057.769 | 3540860.615 | 3636056.077 | 3332950.846 | 369=
4276.154 | 3689820    |
> 2286723.857 | 3307191.643 | 3400346.571 | 3452527.786 | 3460766.857 | 343=
1042.5   | 3440722.286|
> 2257970.769 | 3151268.385 | 3260150.538 | 3379383.846 | 3424028.846 | 343=
3384.308 | 3385635.231| 3406554.538
>  =

> > > # Rx
> > > # =3D=3D
> =

> The rx tests are done with pktgen injecting packets in tap interface, and=
 testpmd in rxonly forward mode. Again, each
> column is a different value of VHOST_NET_BATCH, and each row is base, +ba=
tching, and +buf_api:
> =

> > > # pktgen results (pps)
> =

> (Didn't record extreme cases like >512 bufs batching)
> =

>    1   |   16   |   32   |   64   |   128  |  256   |   512
> -------+--------+--------+--------+--------+--------+--------
> 1223275| 1668868| 1728794| 1769261| 1808574| 1837252| 1846436
> 1456924| 1797901| 1831234| 1868746| 1877508| 1931598| 1936402
> 1368923| 1719716| 1794373| 1865170| 1884803| 1916021| 1975160
> =

> > > # Testpmd pps results
> =

>       1     |     16     |     32     |     64    |    128    |    256   =
  |    512     |    1024    |   2048
> ------------+------------+------------+-----------+-----------+----------=
--+------------+------------+---------
> 1222698.143 | 1670604    | 1731040.6  | 1769218   | 1811206   | 1839308.7=
5 | 1848478.75 |
> 1450140.5   | 1799985.75 | 1834089.75 | 1871290   | 1880005.5 | 1934147.2=
5 | 1939034    |
> 1370621     | 1721858    | 1796287.75 | 1866618.5 | 1885466.5 | 1918670.7=
5 | 1976173.5  | 1988760.75 | 1978316
> =

> The last extreme cases (>512 bufs batched) were recorded just for the buf=
api case.
> =

> Does that make sense now?
> =

> Thanks!

yes, thanks!

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
