Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E68F7D18EA
	for <lists.virtualization@lfdr.de>; Sat, 21 Oct 2023 00:07:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58AA161186;
	Fri, 20 Oct 2023 22:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58AA161186
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=WxUl7WlF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIj6ESzVMi9e; Fri, 20 Oct 2023 22:07:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 25F106FCC1;
	Fri, 20 Oct 2023 22:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25F106FCC1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65AC2C008C;
	Fri, 20 Oct 2023 22:07:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45E74C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Oct 2023 22:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 136F94EFA4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Oct 2023 22:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 136F94EFA4
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=WxUl7WlF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EV4Y1jbTeNkq
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Oct 2023 22:07:06 +0000 (UTC)
Received: from sonic315-27.consmr.mail.ne1.yahoo.com
 (sonic315-27.consmr.mail.ne1.yahoo.com [66.163.190.153])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 197464EFA6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Oct 2023 22:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 197464EFA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1697839624; bh=0ziqnC6GtzppY59+9/AQV5xoPS6hUBAE5tIKAAtv07A=;
 h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To;
 b=WxUl7WlF4yZKsC600cW2yjh3Lmn9uAVCLv2BZa9S1lt+vtHHkcxbfPS6yNZNvw6bQoka/VUDbjpLcCVOKLVY3P56s6v0PWUAe6nfjyVv6rcybsfX6Dcot8QzGj4FzWEExYa3mVe3twhxW6AVNcs9J26rFOYXQRE/1aV9vg3vnqB9+gtADmKqXd5J3lgWL2w5ef3v7oVITLsVJtGBTWc5L+sMoavT32+5fKhCa0p3mWL2jljkmAgRbfGvx8A8FpKKK9FJUwpTVKSL/HfVi3giko+d2W5/okd7xsJumpsoH7UegrH8ktywlp4d1bRHH6eNlLt1uOSNNvz2Txd+oXY5YQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1697839624; bh=oQqhBinfNM6VlQ1VEno3Uml3fC6K79cvhV4wwFgAV33=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=VvSPdmLyeEoH8RUfpG/6fKY9ooE7mZ8VW4c/d/yPuYXzpjBYvh5uNXebA6lSDbNIMSRNlaXCRVdK4gFCKRChSGnn9MAwbO1a8duksk8UwhJZ/y+DbPPAdB5l57HXooeug+KbKIlkRFF3gN+mRdnr6yhP3sz6hTaczu56IHwEYDGOmQ5bkk6SzC1PxhXEoiLLXuDw2AR4bZ3WiAExDtGDXatf5jCvUoDueOXk9QsfDa1BIIDahwWBN2HipMkxXbyeQwkw2tOFbTZpD+s6AQkhPmX/DPZEqcucjZt51DxRHZnPY6kgc8A4QeVt1Kcff1ZBDpiU5MlAqaYSutsntUvGfg==
X-YMail-OSG: qCqCNKcVM1l75hTPi4rL5OfOmLoSxq00dd2rSya8UJeuCuhnF1ZAxUohwWAtzf6
 o5PanJiy99GbuRx4KoRADpJL.6uzKRfF8esAs2ANW9vKCbedf8dz_XBWeE_qi87SbnRrhfA5e.QU
 NAjoeF9oRVljHBGqXqWBPKY7q5ptY8oWHxQPdA9P1qrI4RaDv7ZN_XyrGAKp5ZdLS7_A0EMZGtwd
 .rb6qUz5JJZ9k1vnDLW0KfHS1ROyLcF_u7MeCVp2vTM5TqwvVy51yIuwCKlhzD0t3UqTi0PyknWX
 wASgFKHliKCObBEUvEG80NoSluWbvKryxhmZ2mRIFcpadZiJ4Q0i47EFWisy.iJqnh2E84BqioCY
 XE4o639ryX89RTJ_4JhTMsu3UYn7KEGFxwzsE0W70iBaBPhSwNZPx_HFVLrtO4jDrYCroj4qDxNg
 FKV5BeoV.jtvXjAlCpj5.LtAUPEcVeC8B8sQ65vIOl9Mv1pznWPe2r0kTU1Ci3TUaXMXDlxTXwCZ
 YBlY9VO9TuZ6ArYUT3qtiOnaRa_Q9HPA9rDHaykVmzmx38KN4bF_j2smQtXGRBaEYnBfBkym6U3F
 rfVqgb6tfklNlvpAM3278_IvsmLBIf4yLie0r4eGOHkoUIIg1ZL.5Cfr.9Rf2i5BXxb7JUBrlZNo
 RUqdmb2UhfFXkWtgPVWZ9u2NMM3cUIoBvQnKUAcRNDy57UqmjSoioJu1E83KMiA.3i1SfzVlJ9_I
 2ykjhdvENQ.8PqgIFsNYqSTd.32tXLx.zFwCPOPYZfnADC8tYNAT45YXwlozcUmXg1G3aAdvW5Gz
 uyniidVXGZXwHd.vYTgwOzQjHRDJTTbPteXKuwQmLCjAaRqLBg6ouccGU65UCuyE0_3Kg1JPBtlh
 RBpnQUsYW0bsIbHVAl2yDfR2s6XVPazH4AKGnAJf.6vnJ0MlqPJQA2Yrh97iA_qpFqbhB4jYtQF6
 Z1PL2sIde5nsJfZRy56dqn_yd321cNzeoFiiMwuB5jXWsDlVaBGQow0zLVb0WKKbJsI8APMr4DdT
 8GNWf5UoLHLva7mCVYv0xpID5DUdpf0HrFbFFiqwjrkspAbnHv8SbkO2YIgn2NM_Tp3jyN3ubhnz
 _lnaPByZkgeMVqO6XI4QAoZAKHRENx5hixyS3ENMG_2b.OfKB89vGbwnR_gPG6NdXP.NGa72gqFg
 ci_pV9h_9NuVbWDBAdHtLjvQW6wVjmhbP4KIkEamaO_6aPEKgskpFAV51ooNWYxtAlLAC6NStl4R
 IXO_5mbWf0FlNa.zgVBaBRT6InCbFs7ad9hqUJCyA22MLpw8NZC1xeoVplN7PVZGY8nre_BQYZBe
 m_6Ld8_RiiTEbVzNMqIUcoAfHL7O0lKfFx3121P0nrv9dKYNjbD0ZhCN5NKWstGpKvRtxI.2uVKW
 GbjnlPBaAbxt248FtxE.wE.HbVjdvgxnI.TBZKXxGWt0xbK7RtkFKnYSXs1aGzk3CTacbjxCfMSf
 Oir68lcnheeoyGDAI261XpckB7ctpqsKrnGTouvJ8X9pAzcG040A0Md.saoNWPq99_knrgimYGFn
 9dj_MvJz4i08Pl6riy7skjaz3Y.e35ijw0UQ0v6EybzAapupDMAhDEuad8cz4C6ArYliGg300LAJ
 e2QpbcJVDhRh4XGFJgZ.Swsjwu_HZfIqienB8CROOSziUx5tE6gPzKDMp5hr8erhn2JKii9L_yMp
 ukHVc7bK8ZkV.NiUJraDniBZ9uz7vcW0fm6HV4SgaJKJR9W5m5UclFgzJDbm3znZGw8_UxYol5Qt
 6bNJD_nj6xsijUvtb9nnapGNNM_DcM58yTaDBL2Kophgnv_HDtTiEVIvmO_4VcN8Pgkzh2blYpfZ
 Kc1dy0iqlktjnS.btekvkCrkWJoY9BLXTLnuf2xcDVmSno4XUAQ.NXUf24pI0NEj_ieJLjM7I1DT
 JW6p8ngMKAvQD31UYowPvF.JNBSnxXSJmPV.tzbbSOLA41tKVF2MJkiL.wxNw6SzhLUNr7aBtzvn
 m2x8s3lxXVtsDz7S8X64BnmxqTK1TG_UEJyTzx4FWSdWlhmCWhjfOMBhkR6nLtkuUaMHVdwXzaCr
 N.w1FHciMr_cTvTBtqQsHPx8drEoCcObLAs00pSuBaBFj2lZszjbfg0wBjiU5eEwzAE27aCje_j8
 MIYWMwxYCCZKC0m2fcbT1nvvuPtcjQdq8idMXPsCCAp5k5Xp7SA0Sc_QF7QO6jF8EMPL7S_1.CGw
 7Iv13vBaJmCLAPeDJFjhkc4YvAu54SRY09OBizuiY_bL1tIFXEUcFEGPcg0EgQ3fL_jwrKOYcBtK
 vt.rqQao8eA--
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: cb3359e9-1952-4f3d-9dbe-04a415f4cd58
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Oct 2023 22:07:04 +0000
Received: by hermes--production-ne1-68668bc7f7-bm5xs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8af551ea7d173eec0b0ab5b18ea32b26; 
 Fri, 20 Oct 2023 22:07:03 +0000 (UTC)
Message-ID: <499aa925-f1fc-43de-ad5c-2fab28fb38e7@schaufler-ca.com>
Date: Fri, 20 Oct 2023 15:07:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] vduse: validate block features only with block
 devices
Content-Language: en-US
To: Maxime Coquelin <maxime.coquelin@redhat.com>, mst@redhat.com,
 jasowang@redhat.com, xuanzhuo@linux.alibaba.com, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com,
 eparis@parisplace.org, xieyongji@bytedance.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 david.marchand@redhat.com, lulu@redhat.com,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20231020155819.24000-1-maxime.coquelin@redhat.com>
 <20231020155819.24000-2-maxime.coquelin@redhat.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20231020155819.24000-2-maxime.coquelin@redhat.com>
X-Mailer: WebService/1.1.21797
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

On 10/20/2023 8:58 AM, Maxime Coquelin wrote:
> This patch is preliminary work to enable network device
> type support to VDUSE.
>
> As VIRTIO_BLK_F_CONFIG_WCE shares the same value as
> VIRTIO_NET_F_HOST_TSO4, we need to restrict its check
> to Virtio-blk device type.
>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Reviewed-by: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> ---
>  drivers/vdpa/vdpa_user/vduse_dev.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index df7869537ef1..5b3879976b3d 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -1662,13 +1662,14 @@ static bool device_is_allowed(u32 device_id)
>  	return false;
>  }
>  
> -static bool features_is_valid(u64 features)
> +static bool features_is_valid(struct vduse_dev_config *config)

This should either be features_are_valid() or feature_is_valid().
Correct pluralization is important in the English language.

>  {
> -	if (!(features & (1ULL << VIRTIO_F_ACCESS_PLATFORM)))
> +	if (!(config->features & (1ULL << VIRTIO_F_ACCESS_PLATFORM)))
>  		return false;
>  
>  	/* Now we only support read-only configuration space */
> -	if (features & (1ULL << VIRTIO_BLK_F_CONFIG_WCE))
> +	if ((config->device_id == VIRTIO_ID_BLOCK) &&
> +			(config->features & (1ULL << VIRTIO_BLK_F_CONFIG_WCE)))
>  		return false;
>  
>  	return true;
> @@ -1695,7 +1696,7 @@ static bool vduse_validate_config(struct vduse_dev_config *config)
>  	if (!device_is_allowed(config->device_id))
>  		return false;
>  
> -	if (!features_is_valid(config->features))
> +	if (!features_is_valid(config))
>  		return false;
>  
>  	return true;
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
