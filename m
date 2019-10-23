Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E06CDE2595
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 23:43:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EE3A6D39;
	Wed, 23 Oct 2019 21:43:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E6974B8E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 21:43:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5C82D89C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571866999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=6hpFFnPZykrPqLg3oDhEyOYsEg/U+o2e+slzG/d5mzQ=;
	b=DJEOMJibX2fUf5gJXlnPKMitVY1S6TNQdFMHFd/vJeuwuoMeA9j3ExrFAfNFh56HXXddej
	ChzMR5LH/ARdQAo5xirDggDrSFXbp1KA6v6tR5HQaw0CJpTVbbxJqRPq+akSbIEU3rNQMc
	uweQ71rN2q8lWbss9ryEQ0rtvd9qYkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-386-O4PFHJpqNaaC_G9ArySt4g-1; Wed, 23 Oct 2019 17:43:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEBC01800D6B;
	Wed, 23 Oct 2019 21:43:11 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0666F5D6D0;
	Wed, 23 Oct 2019 21:42:45 +0000 (UTC)
Date: Wed, 23 Oct 2019 15:42:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 2/6] modpost: add support for mdev class id
Message-ID: <20191023154245.32e4fa49@x1.home>
In-Reply-To: <20191023130752.18980-3-jasowang@redhat.com>
References: <20191023130752.18980-1-jasowang@redhat.com>
	<20191023130752.18980-3-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: O4PFHJpqNaaC_G9ArySt4g-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, 23 Oct 2019 21:07:48 +0800
Jason Wang <jasowang@redhat.com> wrote:

> Add support to parse mdev class id table.
> 
> Reviewed-by: Parav Pandit <parav@mellanox.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vfio/mdev/vfio_mdev.c     |  2 ++
>  scripts/mod/devicetable-offsets.c |  3 +++
>  scripts/mod/file2alias.c          | 10 ++++++++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
> index 7b24ee9cb8dd..cb701cd646f0 100644
> --- a/drivers/vfio/mdev/vfio_mdev.c
> +++ b/drivers/vfio/mdev/vfio_mdev.c
> @@ -125,6 +125,8 @@ static const struct mdev_class_id id_table[] = {
>  	{ 0 },
>  };
>  
> +MODULE_DEVICE_TABLE(mdev, id_table);
> +

Two questions, first we have:

#define MODULE_DEVICE_TABLE(type, name)                                 \
extern typeof(name) __mod_##type##__##name##_device_table               \
  __attribute__ ((unused, alias(__stringify(name))))

Therefore we're defining __mod_mdev__id_table_device_table with alias
id_table.  When the virtio mdev bus driver is added in 5/6 it uses the
same name value.  I see virtio types all register this way (virtio,
id_table), so I assume there's no conflict, but pci types mostly (not
entirely) seem to use unique names.  Is there a preference to one way
or the other or it simply doesn't matter?

>  static struct mdev_driver vfio_mdev_driver = {
>  	.name	= "vfio_mdev",
>  	.probe	= vfio_mdev_probe,
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index 054405b90ba4..6cbb1062488a 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -231,5 +231,8 @@ int main(void)
>  	DEVID(wmi_device_id);
>  	DEVID_FIELD(wmi_device_id, guid_string);
>  
> +	DEVID(mdev_class_id);
> +	DEVID_FIELD(mdev_class_id, id);
> +
>  	return 0;
>  }
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index c91eba751804..d365dfe7c718 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1335,6 +1335,15 @@ static int do_wmi_entry(const char *filename, void *symval, char *alias)
>  	return 1;
>  }
>  
> +/* looks like: "mdev:cN" */
> +static int do_mdev_entry(const char *filename, void *symval, char *alias)
> +{
> +	DEF_FIELD(symval, mdev_class_id, id);
> +
> +	sprintf(alias, "mdev:c%02X", id);

A lot of entries call add_wildcard() here, should we?  Sorry for the
basic questions, I haven't played in this code.  Thanks,

Alex

> +	return 1;
> +}
> +
>  /* Does namelen bytes of name exactly match the symbol? */
>  static bool sym_is(const char *name, unsigned namelen, const char *symbol)
>  {
> @@ -1407,6 +1416,7 @@ static const struct devtable devtable[] = {
>  	{"typec", SIZE_typec_device_id, do_typec_entry},
>  	{"tee", SIZE_tee_client_device_id, do_tee_entry},
>  	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
> +	{"mdev", SIZE_mdev_class_id, do_mdev_entry},
>  };
>  
>  /* Create MODULE_ALIAS() statements.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
