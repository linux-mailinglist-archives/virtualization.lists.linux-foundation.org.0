Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D2ADDA1
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 18:56:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 832FFE7E;
	Mon,  9 Sep 2019 16:56:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 17513E76
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:56:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AA8377DB
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:56:38 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1B498E251
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:56:37 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id j10so7647344wrb.16
	for <virtualization@lists.linux-foundation.org>;
	Mon, 09 Sep 2019 09:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=b+DYBvL0oEEFzvAdvWpG5+5SFlJp7gZgu0SZ3ZeObvI=;
	b=FYQLbkFsBUQu5eVoRpIwNq/rHx7cXtbgHl5awd6oi5pmcIfcVURmbEc5alGh8xuMU4
	kMZTk/seGh7orqMrtC1C8F9hPHV0izZSU7B7mwXm3DKGApdKeNkqjnEi/WT5rS7sCfZV
	T+xg9CkMufzcMOkZzhHqvgC7kSEvXWAfyVp2u4M7V4CCIQQSwXo8HSpcbBtUX5+4RI/X
	NZmq6G3vF3dRNqO2TtSVguh2XcmQuIWJsgfRD9r5Qpc8RR6XRnjaeCvff2Brh6uJgprD
	p8OFbH2rcIJnIvEq550GzBSqQIO8delueqkgq+zIP+lvDhs6/SVKKd0F4gIc/XUswqHc
	TAbA==
X-Gm-Message-State: APjAAAVybtwh/9N5IjmyO2dfNFImHS1aBW6VtQI1U3zhYSi+lS3sD2cM
	JcI9mCiT83MBZv9NXEZqXygZyW/9sydRB3pzVeBxvR+Q5k+RDSEM11wGYaZI+BzbWWclrHRTWqA
	6+sGE7uorIF1mgCg/oOT41eKySG243fWC5tuh6WyPjw==
X-Received: by 2002:adf:e342:: with SMTP id n2mr2723313wrj.341.1568048196574; 
	Mon, 09 Sep 2019 09:56:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCDEHfmFTtFBYf4wpg2xKJ2cjZDTuhPEW8XcTtrVh3SrWj7ioRNCGl/I1N77Z+ytfjL6XmFA==
X-Received: by 2002:adf:e342:: with SMTP id n2mr2723289wrj.341.1568048196307; 
	Mon, 09 Sep 2019 09:56:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4580:a289:2f55:eec1?
	([2001:b07:6468:f312:4580:a289:2f55:eec1])
	by smtp.gmail.com with ESMTPSA id
	q15sm18613985wrg.65.2019.09.09.09.56.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 09 Sep 2019 09:56:35 -0700 (PDT)
Subject: Re: [PATCH v2] scsi: virtio_scsi: unplug LUNs when events missed
To: Stefan Hajnoczi <stefanha@redhat.com>, Matt Lupfer <mlupfer@ddn.com>
References: <20190905181903.29756-1-mlupfer@ddn.com>
	<20190906085409.GC5900@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <45d4fc47-cfc2-b7ae-e147-fb993a77e9e5@redhat.com>
Date: Mon, 9 Sep 2019 18:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906085409.GC5900@stefanha-x1.localdomain>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"mst@redhat.com" <mst@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0137876054551001053=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0137876054551001053==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pxnQuVbtWYEwmX3SJy3OhOXnAXOYEWRNZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pxnQuVbtWYEwmX3SJy3OhOXnAXOYEWRNZ
Content-Type: multipart/mixed; boundary="KlMsZ2txnG2HaPm51dmD2esB01PSzQkME";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Matt Lupfer <mlupfer@ddn.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <45d4fc47-cfc2-b7ae-e147-fb993a77e9e5@redhat.com>
Subject: Re: [PATCH v2] scsi: virtio_scsi: unplug LUNs when events missed
References: <20190905181903.29756-1-mlupfer@ddn.com>
 <20190906085409.GC5900@stefanha-x1.localdomain>
In-Reply-To: <20190906085409.GC5900@stefanha-x1.localdomain>

--KlMsZ2txnG2HaPm51dmD2esB01PSzQkME
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/09/19 10:54, Stefan Hajnoczi wrote:
> On Thu, Sep 05, 2019 at 06:19:28PM +0000, Matt Lupfer wrote:
>> The event handler calls scsi_scan_host() when events are missed, which=

>> will hotplug new LUNs.  However, this function won't remove any
>> unplugged LUNs.  The result is that hotunplug doesn't work properly wh=
en
>> the number of unplugged LUNs exceeds the event queue size (currently 8=
).
>>
>> Scan existing LUNs when events are missed to check if they are still
>> present.  If not, remove them.
>>
>> Signed-off-by: Matt Lupfer <mlupfer@ddn.com>
>> ---
>>  drivers/scsi/virtio_scsi.c | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>=20
> Please include a changelog in future patch revisions.  For example:
>=20
>   Signed-off-by: ...
>   ---
>   v2:
>     * Replaced magic constants with sd.h constants [Michael]
>=20
> Just C and virtio code review, no SCSI specifics:
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


--KlMsZ2txnG2HaPm51dmD2esB01PSzQkME--

--pxnQuVbtWYEwmX3SJy3OhOXnAXOYEWRNZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl12hBQACgkQv/vSX3jH
roNf/QgAmxUxJG1dOWyJiM9cOE05ZHpVBvjYtllR4MHb7M3HkgznPc7bAe3ojMCh
MjjpnhamcSKKTKtx9cgDK1bh8uj8viucaOZ43r0/P+npJO8XsdwwAlzfx5WMQ/Al
qEaNVoX1KUxdWZAEYS1y52JmEvOf+0SlmaeJZMYQOWSJHepaM3d7l2vslFhZMIdt
y054MXFZiJxyEB/AE8R/Xy7LPe9/CHliHqxDBMVjLYRFuUeqtkgAXjKUVsThUsGt
EIKONYmN0aQ+Nl8bphUlxHhVVUgCTZ+YP/OCQqAOWtGKpINsFKBcvipeJeAVj3id
Z7Jdh+v01Bs92VJ3BdQHgIbvvRulCA==
=O1le
-----END PGP SIGNATURE-----

--pxnQuVbtWYEwmX3SJy3OhOXnAXOYEWRNZ--

--===============0137876054551001053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0137876054551001053==--
