Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0627D4E2
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 19:49:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6382220133;
	Tue, 29 Sep 2020 17:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VnVGgUklgAwj; Tue, 29 Sep 2020 17:49:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3F50A2034C;
	Tue, 29 Sep 2020 17:49:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 154BAC016F;
	Tue, 29 Sep 2020 17:49:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95E54C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 17:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 88AA2844F1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 17:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id McSv+M3w1xf7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 17:49:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5A80786700
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 17:49:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 156ECAFFD;
 Tue, 29 Sep 2020 17:49:37 +0000 (UTC)
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
Date: Tue, 29 Sep 2020 19:49:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============9197976759633016324=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============9197976759633016324==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TxZtp2xZDgS8tF4LCH0pvplac5jBMMD1n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TxZtp2xZDgS8tF4LCH0pvplac5jBMMD1n
Content-Type: multipart/mixed; boundary="KHQT7KYakINZF3D85LRV0AG8BWDH6IVnP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Message-ID: <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
In-Reply-To: <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>

--KHQT7KYakINZF3D85LRV0AG8BWDH6IVnP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Christian

Am 29.09.20 um 17:35 schrieb Christian K=C3=B6nig:
> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and location=

>> from and instance of TTM's kmap_obj and initializes struct dma_buf_map=

>> with these values. Helpful for TTM-based drivers.
>=20
> We could completely drop that if we use the same structure inside TTM a=
s
> well.
>=20
> Additional to that which driver is going to use this?

As Daniel mentioned, it's in patch 3. The TTM-based drivers will
retrieve the pointer via this function.

I do want to see all that being more tightly integrated into TTM, but
not in this series. This one is about fixing the bochs-on-sparc64
problem for good. Patch 7 adds an update to TTM to the DRM TODO list.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> =C2=A0 include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
>> =C2=A0 include/linux/dma-buf-map.h=C2=A0 | 20 ++++++++++++++++++++
>> =C2=A0 2 files changed, 44 insertions(+)
>>
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api=
=2Eh
>> index c96a25d571c8..62d89f05a801 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -34,6 +34,7 @@
>> =C2=A0 #include <drm/drm_gem.h>
>> =C2=A0 #include <drm/drm_hashtab.h>
>> =C2=A0 #include <drm/drm_vma_manager.h>
>> +#include <linux/dma-buf-map.h>
>> =C2=A0 #include <linux/kref.h>
>> =C2=A0 #include <linux/list.h>
>> =C2=A0 #include <linux/wait.h>
>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
>> ttm_bo_kmap_obj *map,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return map->virtual;
>> =C2=A0 }
>> =C2=A0 +/**
>> + * ttm_kmap_obj_to_dma_buf_map
>> + *
>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
>> + * @map: Returns the mapping as struct dma_buf_map
>> + *
>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memo=
ry
>> + * is not mapped, the returned mapping is initialized to NULL.
>> + */
>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj=

>> *kmap,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct dma_buf_map *map)
>> +{
>> +=C2=A0=C2=A0=C2=A0 bool is_iomem;
>> +=C2=A0=C2=A0=C2=A0 void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_iom=
em);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!vaddr)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_clear(map);
>> +=C2=A0=C2=A0=C2=A0 else if (is_iomem)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr_iome=
m(map, (void __force __iomem *)vaddr);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr(map,=
 vaddr);
>> +}
>> +
>> =C2=A0 /**
>> =C2=A0=C2=A0 * ttm_bo_kmap
>> =C2=A0=C2=A0 *
>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h=

>> index fd1aba545fdf..2e8bbecb5091 100644
>> --- a/include/linux/dma-buf-map.h
>> +++ b/include/linux/dma-buf-map.h
>> @@ -45,6 +45,12 @@
>> =C2=A0=C2=A0 *
>> =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr(&map. 0xdeadbea=
f);
>> =C2=A0=C2=A0 *
>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem()=
=2E
>> + *
>> + * .. code-block:: c
>> + *
>> + *=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>> + *
>> =C2=A0=C2=A0 * Test if a mapping is valid with either dma_buf_map_is_s=
et() or
>> =C2=A0=C2=A0 * dma_buf_map_is_null().
>> =C2=A0=C2=A0 *
>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
>> dma_buf_map *map, void *vaddr)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map->is_iomem =3D false;
>> =C2=A0 }
>> =C2=A0 +/**
>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
>> an address in I/O memory
>> + * @map:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The dma-buf mappin=
g structure
>> + * @vaddr_iomem:=C2=A0=C2=A0=C2=A0 An I/O-memory address
>> + *
>> + * Sets the address and the I/O-memory flag.
>> + */
>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *ma=
p,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 void __iomem *vaddr_iomem)
>> +{
>> +=C2=A0=C2=A0=C2=A0 map->vaddr_iomem =3D vaddr_iomem;
>> +=C2=A0=C2=A0=C2=A0 map->is_iomem =3D true;
>> +}
>> +
>> =C2=A0 /**
>> =C2=A0=C2=A0 * dma_buf_map_is_equal - Compares two dma-buf mapping str=
uctures
>> for equality
>> =C2=A0=C2=A0 * @lhs:=C2=A0=C2=A0=C2=A0 The dma-buf mapping structure
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--KHQT7KYakINZF3D85LRV0AG8BWDH6IVnP--

--TxZtp2xZDgS8tF4LCH0pvplac5jBMMD1n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9zc60UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNPnwf/aCTKdBejEjGzelqMuF4UePySm/kg
uxWq4a3bhUNU/jUfaYErgmfPo7k2kd8GBKNwzUIWBmuanOtyVjPUASvzWxWn7GBo
c0Y2iWSttNk7zk3Qr330IDKDPtQjtzVbklLBu1YsbOQi0WqdzK0uFpRKl9MAvmth
5mi7+IzMbP/w3eu8z71VaPc7xy5tYCmeeyqeEPIEV3CoY4QnFaJDhRxenlDIZ/bR
M9RHikgzelrT1Nra42ooEtT6b3mBp4p63jHBHzTQnSjlAYT1khyKFLvQSHjNPyCN
GMHZqwUnG3U9EMjYvcGsvk7hZ4ROSOwVpq0j00R3hAK5rfbg6C1+v4XNSQ==
=/tV0
-----END PGP SIGNATURE-----

--TxZtp2xZDgS8tF4LCH0pvplac5jBMMD1n--

--===============9197976759633016324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============9197976759633016324==--
