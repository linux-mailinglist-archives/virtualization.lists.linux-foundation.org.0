Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D31D488A59
	for <lists.virtualization@lfdr.de>; Sun,  9 Jan 2022 16:56:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA4781443;
	Sun,  9 Jan 2022 15:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTLP-hGDVUAq; Sun,  9 Jan 2022 15:56:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E5AE68143E;
	Sun,  9 Jan 2022 15:56:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68C16C001E;
	Sun,  9 Jan 2022 15:56:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 053E4C001E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  9 Jan 2022 15:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6F7040130
 for <virtualization@lists.linux-foundation.org>;
 Sun,  9 Jan 2022 15:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNDTd9ERbliM
 for <virtualization@lists.linux-foundation.org>;
 Sun,  9 Jan 2022 15:56:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A3E4400CD
 for <virtualization@lists.linux-foundation.org>;
 Sun,  9 Jan 2022 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641743775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J7V1ZXHLUPXbLKGQxjrSNZfe50jHyedl6dKQf1BF2XY=;
 b=VC4UKt+2OTZBO+XvZOhdDFe2TL5Y9I1h6azIohiu6SSTxI1F/rU14sMixvdheK7quU+556
 C/hrWydaM3D7+FzUqakvwqABaxiTHTUy1hvu1DsLdEz1WerWbnvYuCQX7VZhrpqG7XhwCz
 hvaO3gbGiCoYB165Il7pxOa34jGgX20=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-MTHJetccNVyRq-teKgqhbA-1; Sun, 09 Jan 2022 10:56:04 -0500
X-MC-Unique: MTHJetccNVyRq-teKgqhbA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r65-20020a1c4444000000b003478a458f01so3841135wma.4
 for <virtualization@lists.linux-foundation.org>;
 Sun, 09 Jan 2022 07:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J7V1ZXHLUPXbLKGQxjrSNZfe50jHyedl6dKQf1BF2XY=;
 b=5G+6B9qE+kBOwjHvlwkqKuuRaKXKujXwNuzi7Q/aHmlnnDAVuC8uo5M0/Ofcfv4f1M
 vOcKtjq/VVQVloZSa+AS4lfHEVrIFxsb/rmyh5QD0TV/7rEmIbiVJ/1CGEQyMmEpRVlO
 U1ytUnkYbkqAk1sRI7TJjHGZE7enSJ3UUD8zO4ytDBLeIKfaCgfJIxAWtRQjtv8ZSojF
 B8IHprX61AlutVqiNYeNpHKIHM1HJ6jhICox5EcTcDbqhH7bk5sdn2x6EMvdtbFNcsz5
 CKH7gTDEF/gpe8FQITMHHB/GjluHtBheNhLN3jfRhHDofBKestkgd/KcQsxef5Jlk6k0
 FnHQ==
X-Gm-Message-State: AOAM5301m1e/8aYsIGYzfAv1OwXMZdL8JBesNwKs4jyHuc1GwXNIQfh4
 wtdIAbFjJpA4MaXEPtTmk2nH1ObAbH2bUWYRjbIagPwo4x8dyhMNR8zwNSdNejLhtrQygkRVD2i
 +s9xPNtG5zIBmR8SkqdJWBFYvbuq1DBgYi43cxGnJpg==
X-Received: by 2002:a7b:c7da:: with SMTP id z26mr12392521wmk.52.1641743763212; 
 Sun, 09 Jan 2022 07:56:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNEi79CRxQjFDs1Tr8AJ4vn/QoN3V9wwHj33+A6h0wLfeFHwE/3phbm0G7DptlIOkNkq64eA==
X-Received: by 2002:a7b:c7da:: with SMTP id z26mr12392505wmk.52.1641743762966; 
 Sun, 09 Jan 2022 07:56:02 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:c07a:cd29:1c16:894b:6b07])
 by smtp.gmail.com with ESMTPSA id c8sm4697313wmq.34.2022.01.09.07.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 07:56:02 -0800 (PST)
Date: Sun, 9 Jan 2022 10:55:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [mst-vhost:vhost 30/44]
 drivers/vdpa/mlx5/net/mlx5_vnet.c:1247:23: sparse: sparse: cast to
 restricted __le16
Message-ID: <20220109105546-mutt-send-email-mst@kernel.org>
References: <202201082258.aKRHnaJX-lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202201082258.aKRHnaJX-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Eli Cohen <elic@nvidia.com>,
 kbuild-all@lists.01.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Sat, Jan 08, 2022 at 10:48:34PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
> head:   008842b2060c14544ff452483ffd2241d145c7b2
> commit: 7620d51af29aa1c5d32150db2ac4b6187ef8af3a [30/44] vdpa/mlx5: Support configuring max data virtqueue
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220108/202201082258.aKRHnaJX-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 11.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/commit/?id=7620d51af29aa1c5d32150db2ac4b6187ef8af3a
>         git remote add mst-vhost https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
>         git fetch --no-tags mst-vhost vhost
>         git checkout 7620d51af29aa1c5d32150db2ac4b6187ef8af3a
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/vdpa/mlx5/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/vdpa/mlx5/net/mlx5_vnet.c:1247:23: sparse: sparse: cast to restricted __le16
> >> drivers/vdpa/mlx5/net/mlx5_vnet.c:1247:23: sparse: sparse: cast from restricted __virtio16
> 
> vim +1247 drivers/vdpa/mlx5/net/mlx5_vnet.c

Eli? I sent a patch for this - ack?

>   1232	
>   1233	static int create_rqt(struct mlx5_vdpa_net *ndev)
>   1234	{
>   1235		__be32 *list;
>   1236		int max_rqt;
>   1237		void *rqtc;
>   1238		int inlen;
>   1239		void *in;
>   1240		int i, j;
>   1241		int err;
>   1242		int num;
>   1243	
>   1244		if (!(ndev->mvdev.actual_features & BIT_ULL(VIRTIO_NET_F_MQ)))
>   1245			num = 1;
>   1246		else
> > 1247			num = le16_to_cpu(ndev->config.max_virtqueue_pairs);
>   1248	
>   1249		max_rqt = min_t(int, roundup_pow_of_two(num),
>   1250				1 << MLX5_CAP_GEN(ndev->mvdev.mdev, log_max_rqt_size));
>   1251		if (max_rqt < 1)
>   1252			return -EOPNOTSUPP;
>   1253	
>   1254		inlen = MLX5_ST_SZ_BYTES(create_rqt_in) + max_rqt * MLX5_ST_SZ_BYTES(rq_num);
>   1255		in = kzalloc(inlen, GFP_KERNEL);
>   1256		if (!in)
>   1257			return -ENOMEM;
>   1258	
>   1259		MLX5_SET(create_rqt_in, in, uid, ndev->mvdev.res.uid);
>   1260		rqtc = MLX5_ADDR_OF(create_rqt_in, in, rqt_context);
>   1261	
>   1262		MLX5_SET(rqtc, rqtc, list_q_type, MLX5_RQTC_LIST_Q_TYPE_VIRTIO_NET_Q);
>   1263		MLX5_SET(rqtc, rqtc, rqt_max_size, max_rqt);
>   1264		list = MLX5_ADDR_OF(rqtc, rqtc, rq_num[0]);
>   1265		for (i = 0, j = 0; i < max_rqt; i++, j += 2)
>   1266			list[i] = cpu_to_be32(ndev->vqs[j % (2 * num)].virtq_id);
>   1267	
>   1268		MLX5_SET(rqtc, rqtc, rqt_actual_size, max_rqt);
>   1269		err = mlx5_vdpa_create_rqt(&ndev->mvdev, in, inlen, &ndev->res.rqtn);
>   1270		kfree(in);
>   1271		if (err)
>   1272			return err;
>   1273	
>   1274		return 0;
>   1275	}
>   1276	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
