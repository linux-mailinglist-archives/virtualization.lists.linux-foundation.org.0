Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D54928A0
	for <lists.virtualization@lfdr.de>; Tue, 18 Jan 2022 15:44:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10D0660D93;
	Tue, 18 Jan 2022 14:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pp6Iw3XMxYT; Tue, 18 Jan 2022 14:44:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9C58060E1B;
	Tue, 18 Jan 2022 14:44:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17E6EC0077;
	Tue, 18 Jan 2022 14:44:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0703C002F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 14:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D3D860D93
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 14:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99o1UWS4vRbe
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 14:44:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A789260B2D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 14:44:03 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IEMRpn024777; 
 Tue, 18 Jan 2022 14:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=1lJnqhwM1+tr5KTlncLpJJm5BB2RC5le3gmZHwzunt4=;
 b=sUfciZ4Dl/bRjzFyuB3++U0REQbqEmlJIVgL4u92nyBFTJUxDl5VxhRO9P35nA/gP84D
 XtgFMiKSPkeAixpgyGbGO+pTPPeEo45pao+dIhmDadPJhTAJorlUjBUR02sObJattzrn
 gePcYgJliFyV0kj4fF7eu5WjWyhdrhSsib9npjIdpdPATjbLCFp3aqbFQM90tbZCL4Pt
 NLqnlH/OGLQ4VhaaALZaM6QktZtkHYViwvehaFwY3DN5EwX2hziD/eGt3l1xjun668ab
 HCJRlg4QtFceRLaX81NXJ7cuNLletUrD8yuSOSHb03fId7mfEOhRyYMo2ukgtYg68gVh FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnucf7jdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 14:44:02 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IENMQU027058;
 Tue, 18 Jan 2022 14:44:01 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnucf7jd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 14:44:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IEhhw3025307;
 Tue, 18 Jan 2022 14:43:59 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3dknw95dhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 14:43:59 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IEhvcm15466800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 14:43:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2903A4064;
 Tue, 18 Jan 2022 14:43:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94CA1A4068;
 Tue, 18 Jan 2022 14:43:56 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.88.172])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 14:43:56 +0000 (GMT)
Date: Tue, 18 Jan 2022 15:43:50 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio: acknowledge all features before access
Message-ID: <20220118154350.1ff3fa3f.pasic@linux.ibm.com>
In-Reply-To: <20220114200744.150325-1-mst@redhat.com>
References: <20220114200744.150325-1-mst@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kJ3nbY0auipyvV-x0q_V7hmbrEoUnCQi
X-Proofpoint-ORIG-GUID: Vfuu9T5QB6apaiNjkcv4i__tF9wZ_KWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_04,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201180089
Cc: Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>
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

On Fri, 14 Jan 2022 15:09:14 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> The feature negotiation was designed in a way that
> makes it possible for devices to know which config
> fields will be accessed by drivers.
> 
> This is broken since commit 404123c2db79 ("virtio: allow drivers to
> validate features") with fallout in at least block and net.
> We have a partial work-around in commit 2f9a174f918e ("virtio: write
> back F_VERSION_1 before validate") which at least lets devices
> find out which format should config space have, but this
> is a partial fix: guests should not access config space
> without acknowledging features since otherwise we'll never
> be able to change the config space format.

I agree with that. The crux is what does "acknowledge features" exactly
mean. Is it "write features" or "complete the feature negotiation,
including setting FEATURES_OK".

My understanding is, that we should not rely on that the device is
going to act according to the negotiated feature set unless FEATURES_OK
was set successfully.

That would mean, that this change ain't guaranteed to help with the
stated problem. We simply don't know if the fact that features
were written is going to have a side-effect or not. Also see below.

> 
> As a side effect, this also reduces the amount of hypervisor accesses -
> we now only acknowledge features once unless we are clearing any
> features when validating.

My understanding is that this patch basically does for all the features,
what commit 2f9a174f918e ("virtio: write back F_VERSION_1 before
validate") did only for F_VERSION_1 and under certain conditions to
be minimally invasive.

I don't like when s390 is the oddball, so I'm very happy to see us
moving away from that.

> 
> Cc: stable@vger.kernel.org
> Fixes: 404123c2db79 ("virtio: allow drivers to validate features")
> Fixes: 2f9a174f918e ("virtio: write back F_VERSION_1 before validate")
> Cc: "Halil Pasic" <pasic@linux.ibm.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Halil, I thought hard about our situation with transitional and
> today I finally thought of something I am happy with.
> Pls let me know what you think. Testing on big endian would
> also be much appreciated!

Thanks! I will first provide some comments, and I intend to come back
with the test results later.

> 
>  drivers/virtio/virtio.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index d891b0a354b0..2ed6e2451fd8 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -168,12 +168,10 @@ EXPORT_SYMBOL_GPL(virtio_add_status);
>  
>  static int virtio_finalize_features(struct virtio_device *dev)
>  {
> -	int ret = dev->config->finalize_features(dev);
>  	unsigned status;
> +	int ret;
>  
>  	might_sleep();
> -	if (ret)
> -		return ret;
>  
>  	ret = arch_has_restricted_virtio_memory_access();
>  	if (ret) {
> @@ -244,17 +242,6 @@ static int virtio_dev_probe(struct device *_d)
>  		driver_features_legacy = driver_features;
>  	}
>  
> -	/*
> -	 * Some devices detect legacy solely via F_VERSION_1. Write
> -	 * F_VERSION_1 to force LE config space accesses before FEATURES_OK for
> -	 * these when needed.
> -	 */
> -	if (drv->validate && !virtio_legacy_is_little_endian()
> -			  && device_features & BIT_ULL(VIRTIO_F_VERSION_1)) {
> -		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
> -		dev->config->finalize_features(dev);
> -	}
> -
>  	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
>  		dev->features = driver_features & device_features;
>  	else
> @@ -265,10 +252,22 @@ static int virtio_dev_probe(struct device *_d)
>  		if (device_features & (1ULL << i))
>  			__virtio_set_bit(dev, i);
>  
> +	err = dev->config->finalize_features(dev);

A side note: config->finalize_features() ain't the best name for what the
thing does. After config->finalize_features() the features are not final.
Unlike after virtio_finalize_features(). IMHO filter_and_write_features()
would be a more accurate, although longer name.

After this point, the features aren't final yet, and one can not say
that a some feature X has been negotiated. But with regards to features,
the spec does not really consider this limbo state.

Should this change? Do we want to say: the device SHOULD pick up, and
act upon the new features *before* FEATURES_OK is set?

...

> +	if (err)
> +		goto err;
> +
>  	if (drv->validate) {
> +		u64 features = dev->features;
> +
>  		err = drv->validate(dev);

... Consider the "we would like to introduce a new config space format"
example. Here, I guess we would like to use the new format. But let's say
_F_CFG_FMT_V2 aint negotiated yet. So to be sure about the format, we
would need to specify, that the behavior of the device needs to change
after the feature has been written, but before FEATURES_OK is set, at
least for _F_CFG_FMT_V2.

Please also consider the QEMU implementation of the vhost-user stuff. We
push the features to the back-end only when FEATURES_OK status is
written.


>  		if (err)
>  			goto err;
> +
> +		if (features != dev->features) {
> +			err = dev->config->finalize_features(dev);

It is fine to call it again, because the features aren't finalized yet.
And re-doing any transport-level filtering and validation is fine as
well.

> +			if (err)
> +				goto err;
> +		}
>  	}
>  
>  	err = virtio_finalize_features(dev);

Here the features are finally negotiated and final.

> @@ -495,6 +494,10 @@ int virtio_device_restore(struct virtio_device *dev)
>  	/* We have a driver! */
>  	virtio_add_status(dev, VIRTIO_CONFIG_S_DRIVER);
>  
> +	ret = dev->config->finalize_features(dev);
> +	if (ret)
> +		goto err;
> +
>  	ret = virtio_finalize_features(dev);

Looks a little weird, because virtio_finalize_features() used to include
filter + write + set FEATURES_OK. But it ain't too bad.

Better names would benefit readability though, if we can come up with
some.

Regards,
Halil

>  	if (ret)
>  		goto err;

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
